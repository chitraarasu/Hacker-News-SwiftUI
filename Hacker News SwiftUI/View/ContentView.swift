//
//  ContentView.swift
//  Hacker News SwiftUI
//
//  Created by kirshi on 12/24/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.post) { item in
                NavigationLink(destination: {
                    WebView(urlString: item.url)
                }, label: {
                    HStack {
                        Text(String(item.points))
                        Text(item.title)
                            .navigationTitle("Hacker News")
                    }
                })
            }
        }
        .onAppear(){
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
