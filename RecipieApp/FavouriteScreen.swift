//
//  FavouriteScreen.swift
//  RecipieApp
//
//  Created by Dilshad P on 08/12/24.
//

import SwiftUI

struct FavouriteScreen: View {
    @ObservedObject var viewModel : RecipieViewModel
    var body: some View {
        NavigationStack {
                   VStack {
                       Text("Favourites")
                           .font(.largeTitle)
                           .foregroundColor(.orange)
                           .fontWeight(.bold)
                           .padding()

                       if viewModel.favouriteItems.isEmpty {
                           Text("No favourites yet!")
                               .font(.title2)
                               .foregroundColor(.gray)
                               .padding()
                       } else {
                           List(viewModel.favouriteItems) { recipie in
                               HStack {
                                   AsyncImage(url: URL(string: recipie.imageURL)) { phase in
                                       switch phase {
                                       case .empty:
                                           ProgressView()
                                               .frame(width: 100, height: 100)
                                       case .success(let image):
                                           image.resizable()
                                               .aspectRatio(contentMode: .fit)
                                               .cornerRadius(10)
                                               .frame(width: 100, height: 100)
                                       case .failure:
                                           Image(systemName: "xmark")
                                               .frame(width: 100, height: 100)
                                               .foregroundColor(.red)
                                       @unknown default:
                                           EmptyView()
                                       }
                                   }
                                   VStack(alignment: .leading) {
                                       Text(recipie.name)
                                           .font(.headline)
                                       Text("$\(recipie.price)")
                                           .font(.subheadline)
                                           .foregroundColor(.gray)
                                   }
                                   
                                   Spacer()
                                   
                                   Button {
                                                  viewModel.addFavourite(addedItem: recipie)
                                              } label: {
                                                  Image(systemName: viewModel.favouriteItems.contains(where: { $0.id == recipie.id }) ? "heart.fill" : "heart")
                                                      .foregroundColor(.red)
                                              }
                                              .buttonStyle(PlainButtonStyle())
                               }
                           }
                       }
                   }
               }
    }
}


