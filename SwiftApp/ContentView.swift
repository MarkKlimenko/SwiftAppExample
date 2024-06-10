//
//  ContentView.swift
//  SwiftApp
//
//  Created by Марк Клименко on 02/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Instant Developer")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.indigo)
                Text("Get help from experts in 15 minutes")
            }
            
            HStack(alignment: .bottom, spacing: 10) {
                Image("user1").resizable().scaledToFit()
                Image("user2").resizable().scaledToFit()
                Image("user3").resizable().scaledToFit()
            }.padding(.horizontal, 20)
            
            Text("Need help with coding problems? Register!")
            
            Spacer()
            
            VSignUpButtonGroup()
        }.padding(.top, 30)
    }
}

#Preview {
    ContentView()
}

struct VSignUpButtonGroup: View {
    var body: some View {
        VStack {
            Button {
            } label: {
                Text("Sign Up")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.indigo)
            .cornerRadius(10)
            
            
            Button {
            } label: {
                Text("Log In")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
        }
    }
}
