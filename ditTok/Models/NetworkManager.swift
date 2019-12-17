//
//  NetworkManager.swift
//  ditTok
//
//  Created by Sven Arends on 17/12/2019.
//  Copyright © 2019 Sven Arends. All rights reserved.
//

import Foundation
class NetworkManager: ObservableObject {
    
    @Published var posts = [Child]()
    
    func fetchData(subRedditName: String){
        if let url = URL(string: "https://www.reddit.com/r/"+subRedditName+"/top/.json?count=20") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            let results = try decoder.decode(SubReddit.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.data.children
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
