//
//  API Caller.swift
//  RecipieApp
//
//  Created by Dilshad P on 08/12/24.
//

import Foundation

struct APICaller{
    
    static let shared = APICaller()
    
   private init(){}
    
    private let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
     func fetchData(completed : @escaping (Result<[ReciepeModel],APIError>)->Void){
        
        guard let url = URL(string: baseUrl) else{
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decodedData = try JSONDecoder().decode(RecipieResponse.self, from: data)
                completed(.success(decodedData.request))
            }catch{
                completed(.failure(.unableToComplete))
            }
        }
        task.resume()
    }
}
    