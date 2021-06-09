//
//  StockListViewModel.swift
//  Learn
//
//  Created by Mohammad Azam on 6/8/21.
//

import Foundation

@MainActor 
class StockListViewModel: ObservableObject {
    
    @Published var stocks: [StockViewModel] = []
    
    func getAllStocks() {
        
        async {
            let stocks = await StocksService().getStocks()
            self.stocks = stocks.map(StockViewModel.init)
        }
        
    }
    
}

struct StockViewModel {
    
    let stock: Stock
    
    var name: String {
        stock.name
    }
    
    var price: Double {
        stock.price
    }
    
}
