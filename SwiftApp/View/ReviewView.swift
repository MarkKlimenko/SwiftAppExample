//
//  ReviewView.swift
//  SwiftApp
//
//  Created by Марк Клименко on 28/07/2024.
//

import SwiftUI

struct ReviewView: View {
    var restaurant: Restaurant
    @Binding var isDisplayed: Bool
    
    var body: some View {
        ZStack {
            Image(restaurant.name)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()
            
            Color.black
                .opacity(0.1)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        withAnimation(.easeOut(duration: 0.3)) {
                            self.isDisplayed = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 30.0))
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                }
            }
            
            VStack(alignment: .leading) {
                ForEach(Restaurant.Rating.allCases, id: \.self) { rating in
                    HStack {
                        Image(rating.image)
                        Text(rating.rawValue.capitalized)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }.onTapGesture {
                        self.restaurant.rating = rating
                        self.isDisplayed = false
                    }
                }
            }
        }
    }
}

#Preview("Light mode") {
    ReviewView(
        restaurant: Restaurant(
            name: "Cafe Deadend",
            type: "Cafe",
            location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong",
            phone: "232-923423",
            description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.",
            image: "cafedeadend",
            isFavorite: false),
        isDisplayed: .constant(true)
    )
}
