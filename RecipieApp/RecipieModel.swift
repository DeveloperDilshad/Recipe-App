//
//  ReciepeModel.swift
//  RecipieApp
//
//  Created by Dilshad P on 08/12/24.
//

import Foundation

struct ReciepeModel:Decodable,Identifiable{
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
}

struct RecipieResponse : Decodable {
    let request : [ReciepeModel]
}

struct DemoData {
    
    static let demoData = ReciepeModel(id: 0001,
                                name: "Test Appetizer",
                                description: "This is the description for my appetizer. It's yummy.",
                                price: 9.99,
                                imageURL: "SwiftData",
                                calories: 99,
                                protein: 99,
                                carbs: 99)
    
    static let data = [demoData,demoData,demoData,demoData,demoData,demoData,demoData,demoData]
    
}
