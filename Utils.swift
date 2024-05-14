//
//  Utils.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 5/13/24.
//

import Foundation

extension String {
    static let numberFormatter = NumberFormatter()
    var doubleValue: Double {
        String.numberFormatter.decimalSeparator = "."
        if let result = String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self){
                return result.doubleValue
            }
        }
        return 0
    }
}
