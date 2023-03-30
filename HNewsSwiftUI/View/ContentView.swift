//
//  ContentView.swift
//  HNewsSwiftUI
//
//  Created by Wynelher Tagayuna on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    // The @ObservedObject property wrapper will make the networkManager object the listener.
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationStack{// Navigate between screens.
            List(networkManager.posts){ post in // List identifiable data from posts array.
                NavigationLink(destination: DetailView(url: post.url)) {// Trigger presentation to DetailView
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .navigationTitle("HNews")
        }
        .onAppear {// Will perform the networking() method before View appears.
            self.networkManager.networking()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

