//
//  ListView.swift
//  SwiftApp
//
//  Created by Марк Клименко on 30/06/2024.
//

import Foundation
import SwiftUI

struct ListView: View {
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl"
    , "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"
    ]
    
    var body: some View {
        List {
            ForEach(restaurantNames, id: \.self) { restaurantName in
                HStack(alignment: .bottom, spacing: 10) {
                    Image(restaurantName).resizable().frame(width: 40, height: 40)
                    Text(restaurantName)
                
                }
            }
        }.listStyle(.plain)
    }
}

#Preview {
    ListView()
}
