//
//  RestaurantListView.swift
//  SwiftApp
//
//  Created by Марк Клименко on 23/07/2024.
//

import Foundation
import SwiftUI

struct RestaurantListView: View {
    @State var restaurants = [
        Restaurant(
            name: "Cafe Deadend",
            type: "Coffee & Tea Shop",
            location:"Hong Kong",
            image: "cafedeadend",
            isFavorite: false
        ),
        Restaurant(
            name: "Homei",
            type: "Cafe",
            location: "Hong Kong",
            image: "homei",
            isFavorite: true
        ),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong"
                   , image: "petiteoyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkee", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong"
                   , image: "posatelier", isFavorite: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location:
                    "Sydney", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney"
                   , image: "haigh", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "waffleandwolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York"
                   , image: "confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask", isFavorite: false)
    ]
    
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(restaurants.indices, id: \.self) { index in
                    
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: RestaurantDetailView(restaurant: restaurants[index])) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        FullImageRow(restaurant: $restaurants[index])
                    }
       
                    
                    //                BasicTextImageRow(
                    //                    imageName: restaurantNames[index],
                    //                    name: restaurantNames[index],
                    //                    type: restaurantTypes[index],
                    //                    location: restaurantLocations[index],
                    //                    isFavorite: $restaurantIsFavorites[index]
                    //                )
                }
                .onDelete(perform: { indexSet in
                    restaurants.remove(atOffsets: indexSet)
                })
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            //.navigationTitle("FoodPin")
            .navigationBarTitleDisplayMode(.automatic)
            
        }.tint(.white)
    }
}

#Preview("Light mode") {
    RestaurantListView()
}

#Preview("Dark mode") {
    RestaurantListView()
        .preferredColorScheme(.dark)
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
    // MARK: - Binding
    @Binding var restaurant: Restaurant
    
    // MARK: - State
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(restaurant.name)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack {
                VStack(alignment: .leading){
                    Text(restaurant.name)
                        .font(.system(.title2, design: .rounded))
                    
                    Text(restaurant.type)
                        .font(.system(.body, design: .rounded))
                    
                    Text(restaurant.location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                if restaurant.isFavorite {
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
            }
            .sheet(isPresented: $showOptions) {
                let defaultText = "Just checking in at \(restaurant.name)"
                
                if let imageToShare = UIImage(named: restaurant.name) {
                    ActivityView(activityItems: [defaultText, imageToShare])
                } else {
                    ActivityView(activityItems: [defaultText])
                }
            }
        }
        .contextMenu {
            Button(action: {
                self.showError.toggle()
            }) {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            Button(action: {
                self.restaurant.isFavorite.toggle()
            }) {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
                    Image(systemName: "heart")
                }
            }
            
            Button(action: {
                self.showOptions.toggle()
            }) {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        //        .onTapGesture {
        //            showOptions.toggle()
        //        }.confirmationDialog(
        //            "What do you want to do?",
        //            isPresented: $showOptions,
        //            titleVisibility: .visible
        //        ) {
        //            let favouriteMessage =
        //            if(restaurant.isFavorite == false) {
        //                "Mark as favorite"
        //            } else {
        //                "Remove from favorites"
        //            }
        //
        //            Button("Reserve a table") {
        //                showError.toggle()
        //            }
        //            Button(favouriteMessage) {
        //                restaurant.isFavorite.toggle()
        //            }
        //        }
        .alert(
            "Not yet available",
            isPresented: $showError
        ) {
            Button("OK") {
                
            }
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later.")
        }
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button {
            } label: {
                Image(systemName: "heart")
            }
            .tint(.green)
            Button {
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .tint(.orange)
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
            let favouriteMessage =
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
