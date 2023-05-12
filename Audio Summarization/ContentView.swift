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
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button(action: {
                summaryText = youtubeLink.getYouTubeVideoID() ?? "incorrect link"
                print("summaryTest says \(summaryText)")
            })
            {
                Text("Transcribe Audio")
            }
            .buttonStyle(.bordered)
            
            ScrollView {
                Text(summaryText)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



// Function
extension String {
    func getYouTubeVideoID() -> String? {
        let pattern = #"^(?:https?:\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=)?([a-zA-Z0-9_-]{11})"#
        // Regular expression pattern for matching YouTube video URLs
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return nil }
        // Create regular expression object
        let range = NSRange(location: 0, length: utf16.count)
        // Create range for search
        let match = regex.firstMatch(in: self, range: range)
        // Search for match
        guard let match = match, let videoIDRange = Range(match.range(at: 1), in: self) else { return nil }
        // Extract video ID range from match
        let videoID = String(self[videoIDRange])
        // Extract video ID string from URL using range
        return videoID
    }
}

