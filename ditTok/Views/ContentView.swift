//
//  ContentView.swift
//  ditTok (Reddit Formula 1 Subreddit)
//
//  Created by Sven Arends on 17/12/2019.
//  Copyright © 2019 Sven Arends. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    let subRedditName = "Formula1"
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                HStack {
                    NavigationLink(destination: DetailView(url: post.data.url)) {
                        Text(String(post.data.ups))
                        Text(post.data.title)
                    }
                }
            }
            .navigationBarTitle("Reddit "+subRedditName)
        }.onAppear {
            self.networkManager.fetchData(subRedditName: self.subRedditName)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
