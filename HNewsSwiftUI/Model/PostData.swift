//
//  NetworkModel.swift
//  HNewsSwiftUI
//
//  Created by Wynelher Tagayuna on 3/29/23.
//

import Foundation

// Represent the contents from safeData.
struct PostData: Codable{
    let hits: [Hits]
}

// Identifiable protocol will allow List to be able to recognize the order of Hits objects.
struct Hits: Codable, Identifiable{
    var id: String{// id will
        return objectID
    }
    let title: String
    let points: Int
    let url: String?
    let objectID: String
}
