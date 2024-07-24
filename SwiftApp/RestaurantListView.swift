//
//  RestaurantListView.swift
//  SwiftApp
//
//  Created by Марк Клименко on 23/07/2024.
//

import Foundation
import SwiftUI

struct RestaurantListView: View {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl"
    , "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"
    ]
    
    var body: some View {
        List {
            ForEach(restaurantNames, id: \.self) { restaurantName in
                HStack(alignment: .top, spacing: 20) {
                    Image(restaurantName).resizable()
                        .frame(width: 120, height: 118)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    VStack(alignment: .leading){
                        Text(restaurantName)
                        .font(.system(.title2, design: .rounded))
                        
                        Text("Type")
                        .font(.system(.body, design: .rounded))
                        
                        Text("Location")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.gray)
                    }
                }
            }.listRowSeparator(.hidden)
        }.listStyle(.plain)
    }
}

#Preview {
    RestaurantListView()
}
