//
//  DetailScreenView.swift
//  RecipieApp
//
//  Created by Dilshad P on 08/12/24.
//

import SwiftUI

struct DetailScreenView: View {
    
    var recipie : ReciepeModel
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: recipie.imageURL)){phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 200,height: 200)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                        .frame(width: 300,height: 250)
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
            
            Text(recipie.description)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
            
            Text("$\(recipie.price)")
                .font(.largeTitle)
                .foregroundColor(Color.red)
        }
    }
}

#Preview {
    DetailScreenView(recipie: DemoData.demoData)
}
