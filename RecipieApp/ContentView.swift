//
//  ContentView.swift
//  RecipieApp
//
//  Created by Dilshad P on 08/12/24.
//


import SwiftUI

struct ContentView: View {
    
    let recipieList = DemoData.data
    
    @StateObject var viewModel = RecipieViewModel()
   
    
    var body: some View {
        TabView {
            
            HomeScreen(viewModel: viewModel, selectedRecipie: DemoData.demoData)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            FavouriteScreen(viewModel: viewModel)
                .tabItem{
                    Label("Favourites", systemImage: "heart")
                }
            
        }.onAppear{
            viewModel.fetchData()
        }
        
    }
    
}

#Preview {
    ContentView()
}
