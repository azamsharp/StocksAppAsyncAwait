//
//  Extensions.swift
//  Learn
//
//  Created by Mohammad Azam on 6/8/21.
//

import Foundation

extension Double {
    
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? "$0"
    }
    
}
