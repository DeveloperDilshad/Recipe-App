//
//  RecipieViewModel.swift
//  RecipieApp
//
//  Created by Dilshad P on 08/12/24.
//

import Foundation

final class RecipieViewModel : ObservableObject {
    
    @Published var fetchedList : [ReciepeModel] = []
    @Published var searchText : String = ""
    @Published var favouriteItems : [ReciepeModel] = []
    
    func fetchData(){
        APICaller.shared.fetchData { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let dish):
                    print(dish)
                     fetchedList = dish
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    var filteredItems : [ReciepeModel] {
        if searchText.isEmpty{
            return fetchedList
        }else{
            return fetchedList.filter{
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func addFavourite(addedItem: ReciepeModel) {
        if let index = favouriteItems.firstIndex(where: { $0.id == addedItem.id }) {
            // Item already exists; remove it.
            favouriteItems.remove(at: index)
        } else {
            // Item does not exist; add it.
            favouriteItems.append(addedItem)
        }
    }

}

