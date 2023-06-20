//
//  Double+IsAlmostEqual.swift
//  FiveSenses-iOS
//
//  Created by Narely Lima on 16/06/23.
//

/* https://github.com/stephentyrone/swift/blob/439cced7051f673aa9669f10d89aa2da6701ae92/stdlib/public/core/FloatingPoint.swift */

import Foundation

extension Double {

    public func isAlmostEqual(
        to other: Self,
        tolerance: Self = Self.ulpOfOne.squareRoot()
        ) -> Bool {
        // Tolerances outside of [.ulpOfOne, 1) yield well-defined but useless
        // results, so this is enforced by an assert rathern than a precondition.
        assert(tolerance >= .ulpOfOne && tolerance < 1, "tolerance should be in [.ulpOfOne, 1).")
        // The simple computation below does not necessarily give sensible
        // results if one of self or other is infinite; we need to rescale
        // the computation in that case.
        guard self.isFinite && other.isFinite else {
          return rescaledAlmostEqual(to: other, tolerance: tolerance)
        }
        // This should eventually be rewritten to use a scaling facility to be
        // defined on FloatingPoint suitable for hypot and scaled sums, but the
        // following is good enough to be useful for now.
        let scale = max(abs(self), abs(other), .leastNormalMagnitude)
        return abs(self - other) < scale*tolerance
      }

    internal func rescaledAlmostEqual(to other: Self, tolerance: Self) -> Bool {
       // NaN is considered to be not approximately equal to anything, not even
       // itself.
       if self.isNaN || other.isNaN { return false }
       if self.isInfinite {
         if other.isInfinite { return self == other }
         // Self is infinite and other is finite. Replace self with the binade
         // of the greatestFiniteMagnitude, and reduce the exponent of other by
         // one to compensate.
         let scaledSelf = Self(sign: self.sign,
                               exponent: Self.greatestFiniteMagnitude.exponent,
                               significand: 1)
         let scaledOther = Self(sign: .plus,
                                exponent: -1,
                                significand: other)
         // Now both values are finite, so re-run the naive comparison.
         return scaledSelf.isAlmostEqual(to: scaledOther, tolerance: tolerance)
       }
       // If self is finite and other is infinite, flip order and use scaling
       // defined above, since this relation is symmetric.
       return other.rescaledAlmostEqual(to: self, tolerance: tolerance)
     }
}
