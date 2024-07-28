//
//  SwiftAppApp.swift
//  SwiftApp
//
//  Created by Марк Клименко on 02/06/2024.
//

import SwiftUI

@main
struct FoodPinApp: App {
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor(named: "NavigationBarTitle") ?? UIColor.systemRed,
            .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(named: "NavigationBarTitle") ?? UIColor.systemRed,
            .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        
        navBarAppearance.backgroundColor = .clear
        navBarAppearance.backgroundEffect = .none
        navBarAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            RestaurantListView()
        }
    }
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha
                  : 1.0)
    }
}
