//
//  ContentView.swift
//  Audio Summarization
//
//  Created by Sami Bajwa on 5/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var youtubeLink = ""
    @State private var summaryText = ""
    
    var body: some View {
        VStack {
            TextField("Enter Youtube Link", text: $youtubeLink)
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        
        Button(action: {
            summaryText = "Here's the summary of the audio"
        }) {
            Text("Transcribe Audio")
        }
        .buttonStyle(.bordered)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
