//
//  InventoryIten.swift
//  ItemsTracer
//
//  Created by Luc Nguyen on 31/01/2024.
//
import FirebaseFirestore
import Foundation


struct InventoryIten: Identifiable, Codable, Equatable {
    var id = UUID().uuidString
    @ServerTimestamp var createdAt: Date?
    @ServerTimestamp var updatedAt: Date?
    
    var name: String
    var quantity: Int
    
    var usdzLink: String?
    var usdzURL: URL? {
        guard let usdzLink else { return nil }
        return URL(string: usdzLink)
    }
    
    var thumbnailLink: String?
    var thumbnailURL: URL? {
        guard let thumbnailLink else { return nil }
        return URL(string: thumbnailLink)
    }
    
}
