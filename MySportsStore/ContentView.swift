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
                ForEach($model.products, id: \ .self.0) { $product in
                    ListRow(product: $product)
                }
            }
            .listStyle(.plain)

            Text("\(model.stockTotal) Products in Stock")
                .font(.title)
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
    @Binding var product: (String, String, String, Double, Int)

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(product.0)
                    .font(.title2)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                Stepper("") {
                    product.4 += 1
                } onDecrement: {
                    product.4 -= 1
                }

                TextField(
                    "",
                    value: $product.4,
                    format: .number
                )
                .font(.title2)
                .monospacedDigit()
                .multilineTextAlignment(.trailing)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
            }

            Text(product.1)
                .lineLimit(1)

        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(product: .constant(sampleProduct))
            .padding(.horizontal)
    }

    static var sampleProduct: (String, String, String, Double, Int) {
        ("Kayak", "A boat for one person", "Watersports", 275.0, 10)
    }
}
