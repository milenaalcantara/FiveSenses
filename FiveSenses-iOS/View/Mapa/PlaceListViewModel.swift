//
//  PlaceListViewModel.swift
//  FiveSenses-iOS
//
//  Created by Narely Lima on 16/06/23.
//

import Foundation
import CloudKit

enum RecordType: String {
    case placeList = "PlacesList"
}
class PlaceListViewModel: ObservableObject{

    private var database: CKDatabase
    private var container: CKContainer
    private var latitude = CLLocationDegrees()
    private var longitude = CLLocationDegrees()


    @Published var places: [PlaceViewModel] = []
    @Published var locationDataManager = LocationDataManager()

    init(container: CKContainer) {
        self.container = container
        self.database = self.container.privateCloudDatabase
    }

    // salva o valor e atualiza o placeList
    func saveItem(_ item: PlacesList) {

        // primeiro atualizo os record
        item.updateRecord()

        self.database.save(item.record) { [self] newRecord, error in
            if let error = error {
                print(error)
            } else {
                if let index = places.firstIndex(where: { $0.id == item.id }) {
                    places[index] = .init(placeList: item)
                }
            }
        }
    }

    func saveNewItem(name: String, numbersRepeated: Int, latitude: Double, longitude: Double) {
        let placeListing = PlacesList(name: name, numbersRepeated: numbersRepeated, latitude: latitude, longitude: longitude)
        placeListing.updateRecord()

        self.database.save(placeListing.record) { newRecord, error in
            if let error = error {
                print(error)
            } else {
                if let newRecord = newRecord {
                    if let placeListing = PlacesList.fromRecord(newRecord) {
                        DispatchQueue.main.async {
                            self.places.append(PlaceViewModel(placeList: placeListing))
                        }
                    }
                }
            }
        }
    }

    func populatePlaces() async throws {


        let query = CKQuery(recordType: RecordType.placeList.rawValue, predicate: NSPredicate(value: true))

        let (results, _) = try await database.records(matching: query)

        let records = try results.map({ try $0.1.get() })

        await MainActor.run {
            var placeList: [PlacesList] = []

            placeList = records.compactMap({ PlacesList.fromRecord($0) })

            places = placeList.map(PlaceViewModel.init)
        }
    }
    
    func saveLocation() {
        latitude = locationDataManager.locationManager.location?.coordinate.latitude ?? 0.0
        longitude = locationDataManager.locationManager.location?.coordinate.longitude ?? 0.0

        var place = verifyList(latitude, longitude)
        /* se ja existir um lugar com aquela latidude altera o numero de repeticoes e
         salva o novo local
         */
        if place != nil {
            place?.placeList.numbersRepeated += 1
            saveItem(place!.placeList)

        } else {
            saveNewItem(name: "aqui", numbersRepeated: 1, latitude: latitude, longitude: longitude)

        }
    }

    func verifyList(_ latitudePlace: Double, _ longitudePlace: Double) -> PlaceViewModel? {
        let collection = places
        let filtered = collection.filter {
            $0.latitude.isAlmostEqual(to: latitudePlace, tolerance: 0.00001) &&
            $0.longitude.isAlmostEqual(to: longitudePlace, tolerance: 0.00001)
        }

        if let place = filtered.first {
            return place
        } else {
            return nil
        }
    }

}

struct PlaceViewModel: Identifiable {

    var placeList: PlacesList

    var id: String {
        placeList.id
    }

    var record: CKRecord {
        placeList.record
    }

    var recordID: CKRecord.ID {
        placeList.record.recordID
    }
    var name: String {
        placeList.name
    }
    var numbersRepeated: Int {
        placeList.numbersRepeated
    }
    var latitude: Double {
        placeList.latitude
    }
    var longitude: Double {
        placeList.longitude
    }

}
