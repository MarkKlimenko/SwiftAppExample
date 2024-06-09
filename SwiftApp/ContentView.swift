//
//  ContentView.swift
//  SwiftApp
//
//  Created by Марк Клименко on 02/06/2024.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        
        VStack {
            Button {
                speak("Hello Programming")
                
            } label: {
                Text("Hello World")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
            }
            .padding()
            .foregroundStyle(.white)
            .background(.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Button {
                speak("Hello Anna, How are you? Do you speak English?")
                
            } label: {
                Text("Hello World")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
            }
            .padding()
            .foregroundStyle(.white)
            .background(.purple)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
    
    func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice =
        AVSpeechSynthesisVoice(language: "en-GB")
        
        synthesizer.speak(utterance)
    }
}

#Preview {
    ContentView()
}
