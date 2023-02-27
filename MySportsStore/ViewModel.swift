//
//  ViewModel.swift
//  MySportsStore
//
//  Created by mana on 2023/01/12.
//

import Foundation

class ViewModel: ObservableObject {
   @Published var products = [
    Product(name:"Kayak", description:"A boat for one person", category:"Watersports", price:275.0, stockLevel:10),
    Product(name:"Lifejacket", description:"Protective and fashionable", category:"Watersports", price:48.95, stockLevel:14),
    Product(name:"Soccer Ball", description:"FIFA-approved size and weight", category:"Soccer", price:19.5, stockLevel:32),
    Product(name:"Corner Flags", description:"Give your playing field a professional touch", category:"Soccer", price:34.95, stockLevel:1),
    Product(name:"Stadium", description:"Flat-packed 35,000-seat stadium", category:"Soccer", price:79500.0, stockLevel:4),
    Product(name:"Thinking Cap", description:"Improve your brain efficiency by 75%", category:"Chess", price:16.0, stockLevel:8),
    Product(name:"Unsteady Chair", description:"Secretly give your opponent a disadvantage", category: "Chess", price: 29.95, stockLevel:3),
    Product(name:"Human Chess Board", description:"A fun game for the family", category:"Chess", price:75.0, stockLevel:2),
    Product(name:"Bling-Bling King", description:"Gold-plated, diamond-studded King", category:"Chess", price:1200.0, stockLevel:4)
    ]

    private let formatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = "USD"
        return numberFormatter
    }()

    var displayStockTotal: String {
        let finalTotal: (Int, Double) = products.reduce((0, 0.0)) { partialResult, product in
            (partialResult.0 + product.stockLevel, partialResult.1 + product.stockValue)
        }
        return "\(finalTotal.0)Products in Stock.\nTotal Value: \(String(describing: formatter.string(from: finalTotal.1 as NSNumber) ?? "0"))"
    }
}
