////
////  PlacesList.swift
////  FiveSenses-iOS
////
////  Created by Narely Lima on 16/06/23.
////
//
//import Foundation
//import CloudKit
//
//struct PlacesList: Identifiable {
//
//    let record: CKRecord
//
//    var id: String { record.recordID.recordName }
//    var name: String
//    var latitude: Double
//    var longitude: Double
//    var numbersRepeated: Int = 0
//
//    var coordinate: CLLocationCoordinate2D { .init(latitude: latitude, longitude: longitude) }
//
//    internal init(record: CKRecord, name: String,numbersRepeated: Int, latitude: Double, longitude: Double) {
//        self.record = record
//        self.name = name
//        self.numbersRepeated = numbersRepeated
//        self.latitude = latitude
//        self.longitude = longitude
//    }
//
//    init(name: String, numbersRepeated: Int, latitude: Double, longitude: Double) {
//        self.record = CKRecord(recordType: RecordType.placeList.rawValue)
//        self.name = name
//        self.numbersRepeated = numbersRepeated
//        self.latitude = latitude
//        self.longitude = longitude
//    }
//
//
//    func toDictionary() -> [String: Any] {
//        return ["name": name, "numbersRepeated": numbersRepeated, "latitude": latitude, "longitude": longitude]
//    }
//
//    func updateRecord() {
//        record.setValuesForKeys(self.toDictionary())
//    }
//
//    static func fromRecord(_ record: CKRecord) -> PlacesList? {
//        guard let name = record.value(forKey: "name") as? String,
//              let numbersRepeated = record.value(forKey: "numbersRepeated") as? Int,
//              let latitude = record.value(forKey: "latitude") as? Double,
//              let longitude = record.value(forKey: "longitude") as? Double else { return nil }
//
//        return PlacesList(record: record, name: name, numbersRepeated: numbersRepeated, latitude: latitude, longitude: longitude)
//    }
//}
//
