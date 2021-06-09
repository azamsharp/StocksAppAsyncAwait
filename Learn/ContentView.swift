//
//  ContentView.swift
//  Learn
//
//  Created by Mohammad Azam on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var stockListVM = StockListViewModel()
    
    var body: some View {
        List(stockListVM.stocks, id: \.name) { stock in
            HStack {
                Text(stock.name)
                Spacer()
                Text(stock.price.formatted(FloatingPointFormatStyle.Currency(code: "USD")))
            }
        }.task {
            stockListVM.getAllStocks()
        }.refreshable {
            stockListVM.getAllStocks()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
