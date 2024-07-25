//
//  RestaurantListView.swift
//  SwiftApp
//
//  Created by Марк Клименко on 23/07/2024.
//

import Foundation
import SwiftUI

struct RestaurantListView: View {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"
    ]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"
    ]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "TeaHouse", "Austrian/Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American/Seafood", "American", "American", "Breakfast & Brunch", "Coffee &Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
    
    var body: some View {
        List {
            ForEach(0...restaurantNames.count - 1, id: \.self) { index in
                FullImageRow(
                    imageName: restaurantNames[index],
                    name: restaurantNames[index],
                    type: restaurantTypes[index],
                    location: restaurantLocations[index],
                    isFavorite: $restaurantIsFavorites[index]
                )
                
                //                BasicTextImageRow(
                //                    imageName: restaurantNames[index],
                //                    name: restaurantNames[index],
                //                    type: restaurantTypes[index],
                //                    location: restaurantLocations[index],
                //                    isFavorite: $restaurantIsFavorites[index]
                //                )
            }.listRowSeparator(.hidden)
        }.listStyle(.plain)
    }
}

#Preview("Dark mode") {
    RestaurantListView()
        .preferredColorScheme(.dark)
}

#Preview("Light mode") {
    RestaurantListView()
}

//#Preview("BasicTextImageRow", traits: .sizeThatFitsLayout) {
//BasicTextImageRow(
//    imageName: "cafedeadend", name: "Cafe Deadend",
//    type: "Cafe", location: "Hong Kong",
//    isFavorite: .constant(true))
//}
//
//#Preview("FullImageRow", traits: .sizeThatFitsLayout) {
//    FullImageRow(imageName: "cafedeadend", name: "Cafe Deadend",
//                 type: "Cafe", location: "Hong Kong")
//}

struct FullImageRow: View {
    var imageName: String
    var name: String
    var type: String
    var location: String
    @Binding var isFavorite: Bool
    
    @State private var showOptions = false
    @State private var showError = false
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack {
                VStack(alignment: .leading){
                    Text(name)
                        .font(.system(.title2, design: .rounded))
                    
                    Text(type)
                        .font(.system(.body, design: .rounded))
                    
                    Text(location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                if isFavorite {
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }.confirmationDialog(
            "What do you want to do?",
            isPresented: $showOptions,
            titleVisibility: .visible
        ) {
            var favouriteMessage =
            if(self.isFavorite == false) {
                "Mark as favorite"
            } else {
                "Remove from favorites"
            }
            
            Button("Reserve a table") {
                showError.toggle()
            }
            Button(favouriteMessage) {
                self.isFavorite.toggle()
            }
        }.alert(
            "Not yet available",
            isPresented: $showError
        ) {
            Button("OK") {
                
            }
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later.")
        }
    }
}

struct BasicTextImageRow: View {
    var imageName: String
    var name: String
    var type: String
    var location: String
    @Binding var isFavorite: Bool
    
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.system(.title2, design: .rounded))
                
                Text(type)
                    .font(.system(.body, design: .rounded))
                
                Text(location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.gray)
            }
            
            if isFavorite {
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
            
        }.onTapGesture {
            showOptions.toggle()
        }.confirmationDialog(
            "What do you want to do?",
            isPresented: $showOptions,
            titleVisibility: .visible
        ) {
            var favouriteMessage =
            if(self.isFavorite == false) {
                "Mark as favorite"
            } else {
                "Remove from favorites"
            }
            
            Button("Reserve a table") {
                showError.toggle()
            }
            Button(favouriteMessage) {
                self.isFavorite.toggle()
            }
        }.alert(
            "Not yet available",
            isPresented: $showError
        ) {
            Button("OK") {
                
            }
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later.")
        }
    }
}
