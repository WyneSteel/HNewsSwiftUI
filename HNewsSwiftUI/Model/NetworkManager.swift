//
//  NetworkManager.swift
//  HNewsSwiftUI
//
//  Created by Wynelher Tagayuna on 3/29/23.
//

import Foundation

class NetworkManager: ObservableObject{// ObservableObject enables the broadcasting of propeties like the posts[Hits] array to listeners.
    @Published var posts = [Hits]()// The property wrapper @Published will publish the posts[Hits] to listeners.
    
    func networking(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){// Hacker News API query. All stories that are on the front/home page right now.
            let session = URLSession(configuration: .default)// Start a session.
            let task = session.dataTask(with: url) { data, response, error in// Task that retrieves contents from the url.
                if error != nil{// If there is an error.
                    return
                }
                
                if let safeData = data{// If there is data.
                    let decoder = JSONDecoder()// Decode content from safeData.
                    do{
                        let results = try decoder.decode(PostData.self, from: safeData)
                        DispatchQueue.main.async {// Make UI changes will networking.
                            self.posts = results.hits
                        }
                    }catch{
                        print(error)
                    }
                }
            }
            task.resume()// Resume task.
        }
    }
}
