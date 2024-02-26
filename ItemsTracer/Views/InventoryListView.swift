//
//  InventoryListView.swift
//  ItemsTracer
//
//  Created by Luc Nguyen on 31/01/2024.
//

import SwiftUI

struct InventoryListView: View {
    @StateObject var vm = InventoryListViewModel()
    var body: some View {
        List {
            ForEach(vm.items){
                item in InventoryListItemView(item: item)
            }
        }
        .navigationTitle("Item Tracer")
        .onAppear(){
            vm.listenToItems()
        }
    }
}
struct InventoryListItemView: View {
    let item: InventoryItem
    var body: some View {
        HStack(alignment: .top, spacing: 16){
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text("Quantity: \(item.quantity)")
            }
        }
    }
}
#Preview {
    NavigationStack{
        InventoryListView()

    }
}
