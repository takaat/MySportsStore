//
//  ContentView.swift
//  MySportsStore
//
//  Created by mana on 2023/01/12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = ViewModel()

    var body: some View {
        VStack {
            List {
                ForEach($model.products, id: \ .self.name) { $product in
                    ListRow(product: $product)
                }
            }
            .listStyle(.plain)

            Text(model.displayStockTotal)
                .font(.headline)
                .monospacedDigit()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical,5)
                .background {
                    Color.blue
                        .cornerRadius(8)
                }
                .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListRow: View {
    @Binding var product: Product
    private let logger = Logger { (product: Product) -> Void in
        print("Change: \(product.name) \(product.stockLevel) items in stock")
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(product.name)
                    .font(.title2)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                Stepper("") {
                    product.stockLevel += 1
                } onDecrement: {
                    product.stockLevel -= 1
                }

                TextField(
                    "",
                    value: $product.stockLevel,
                    format: .number
                )
                .font(.title2)
                .monospacedDigit()
                .multilineTextAlignment(.trailing)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
            }

            Text(product.description)
                .lineLimit(1)

        }
        .onChange(of: product) { newProduct in
            logger.logItem(item: newProduct)
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(product: .constant(sampleProduct))
            .padding(.horizontal)
    }

    static var sampleProduct: Product {
        Product(name:"Kayak", description:"A boat for one person", category:"Watersports", price:275.0, stockLevel:10)
    }
}
