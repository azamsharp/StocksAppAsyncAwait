//
//  StocksService.swift
//  Learn
//
//  Created by Mohammad Azam on 6/8/21.
//

import Foundation
import _Concurrency


struct Stock {
    let name: String
    let price: Double
}

class StocksService: ObservableObject {
    
    private func getStocks(_ completion: @escaping ([Stock]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let stocks = [
                Stock(name: "APPLE", price: Double.random(in: 100...200)),
                Stock(name: "GOOGLE", price: Double.random(in: 1000...2000)),
                Stock(name: "MICROSOFT", price: Double.random(in: 300...500))
            ]
            completion(stocks)
        }
    }
    
    func getStocks() async -> [Stock] {
        
        await withUnsafeContinuation { continuation in
            getStocks { result in
                continuation.resume(returning: result)
            }
        }
        
    }
    
}
