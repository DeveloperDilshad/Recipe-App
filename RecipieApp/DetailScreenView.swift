//
//  DetailScreenView.swift
//  RecipieApp
//
//  Created by Dilshad P on 08/12/24.
//

import SwiftUI

struct DetailScreenView: View {
    
    var recipie : ReciepeModel
    @Binding var isShwingDetailView:Bool
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: recipie.imageURL)){phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 300,height: 225)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                        .frame(width: 300,height: 225)
                case .failure( _):
                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .imageScale(.large)
                        .frame(width: 300,height: 250)
                @unknown default:
                    EmptyView()
                }
                
            }
            
            VStack{
                Text(recipie.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(recipie.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing:40){
                    VStack(spacing:5){
                        Text("Calories")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        Text("\(recipie.calories)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack(spacing:5){
                        Text("Carbs")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        Text("\(recipie.carbs)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack(spacing:5){
                        Text("Protien")
                            .font(.caption)
                            .fontWeight(.bold)
                        
                        Text("\(recipie.protein)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }
            
            Spacer()
            
            Button{
                
            }label: {
                Text("$\(recipie.price,specifier: "%.2f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260,height: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.bottom,30)
        }.frame(width: 300,height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button{
                isShwingDetailView = false
            }label: {
                ZStack{
                    Circle().frame(width: 30,height: 30)
                        .foregroundColor(.white)
                        .opacity(0.6)
                    
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44,height: 44)
                        .foregroundColor(.black)
                }
            },alignment: .topTrailing)
    }
}

#Preview {
    DetailScreenView(recipie: DemoData.demoData,isShwingDetailView: .constant(true))
}
