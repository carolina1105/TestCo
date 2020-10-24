//
//  ContentView.swift
//  TestCo
//
//  Created by Laddy Diaz Lamus on 21/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BreedListView()
        }
        Text("Hello, world! La")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
