//
//  OrderView.swift
//  iDine
//
//  Created by Kittikawin Sontinarakul on 20/4/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { order in
                        HStack {
                            Text(order.name)
                            Spacer()
                            Text("$\(order.price)")
                        }
                    }.onDelete(perform: deleteItems(at:))
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order") }
                }.disabled(order.items.isEmpty)
            }
        }.navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
