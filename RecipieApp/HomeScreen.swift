//
//  HomeScreen.swift
//  RecipieApp
//
//  Created by Dilshad P on 08/12/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var viewModel : RecipieViewModel
    @State private var isShowingDetailView = false
    @State  var selectedRecipie : ReciepeModel
    
    var body: some View {
        ZStack{
            NavigationStack{
                VStack{
                    Text("RECIPIE APP")
                        .font(.largeTitle)
                        .foregroundColor(Color.orange)
                        .fontWeight(.black)
                    
                    Text("Perfect App For your Choise")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.red)
                    
                    TextField("Search Reciepe", text: $viewModel.searchText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                
                List(viewModel.filteredItems){ recipie in
                    

                    HStack (){
                            AsyncImage(url: URL(string: recipie.imageURL)){ phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 200,height: 200)
                                case .success(let image):
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(10)
                                        .frame(width: 150,height: 100)
                                    
                                case .failure( _):
                                    Image(systemName: "xmark")
                                        .aspectRatio(contentMode: .fit)
                                        .imageScale(.large)
                                        .cornerRadius(10)
                                        .foregroundColor(Color.red)
                                        .frame(width: 150,height: 100)
                                    
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            
                            VStack(alignment: .leading,spacing: 5){
                                Text(recipie.name)
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.blue)
                                
                                Text("$\(recipie.price)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.gray)
                            }
                        
                        Spacer()
                            
                            Button {
                                viewModel.addFavourite(addedItem: recipie)
                            } label: {
                                Image(systemName: viewModel.favouriteItems.contains(where: { $0.id == recipie.id }) ? "heart.fill" : "heart")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            
                            
                        }.onTapGesture {
                            isShowingDetailView = true
                            selectedRecipie = recipie
                        }
                    
                        
                }
               
                    
            }.blur(radius: isShowingDetailView ? 20 : 0)
            
            if isShowingDetailView {
                DetailScreenView(recipie: selectedRecipie,isShwingDetailView: $isShowingDetailView)
            }
                
            }
        }
        
    }



