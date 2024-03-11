//
//  InventoryFormVM.swift
//  ItemsTracer
//
//  Created by Luc Nguyen on 11/03/2024.
//

import FirebaseFirestore
import FirebaseStorage
import Foundation
import SwiftUI
import QuickLookThumbnailing

class InventoryFormViewModel: ObservableObject{
    let db = Firestore.firestore()
    let formType: FormType
    
    let id:String
    @Published var name = ""
    @Published var quantity = 0
    @Published var usdzURL: URL?
    @Published var thumbnailURL: URL?
    
    @Published var loadingState = LoadintType.none
    @Published var error: String?
    
    var navigationTitle: String {
        switch formType {
        case .add:
            return "Add Item"
        case .edit(let inventoryItem):
            return "Edit Item"
        }
    }
    
    init(formType: FormType = .add)
    {
        self.formType = formType
        switch formType {
        case .add:
            id = UUID().uuidString
        case .edit(let item):
            id = item.id
            name = item.name
            quantity = item.quantity
            if let usdzURL = item.usdzURL{
                self.usdzURL = usdzURL
            }
            if let thumbnailURL = item.thumbnailURL{
                self.thumbnailURL = thumbnailURL
            }
        }
    }
    
    func save() throws {
        loadingState = .savingItem
        
        defer{loadingState = .none}
        
        var item: InventoryItem
        switch formType {
        case .add:
            item = .init(id: id, name: name, quantity: quantity)
        case .edit(let inventoryItem):
            item = inventoryItem
            item.name = name
            item.quantity = quantity
        }
        
        item.usdzLink = usdzURL?.absoluteString
        item.thumbnailLink = thumbnailURL?.absoluteString
        
        do{
            try db.document("items/\(item.id)")
                .setData(from:item, merge: false)
        } catch {
            self.error = error.localizedDescription
            throw error
        }
    }
    
}

enum FormType: Identifiable{
    case add
    case edit(InventoryItem)
    
    var id:String {
        switch self{
        case .add:
            return "add"
        case .edit(let inventoryItem):
            return "edit-\(inventoryItem.id)"
        }
    }
}


enum LoadintType: Equatable {
    case none
    case savingItem
}
