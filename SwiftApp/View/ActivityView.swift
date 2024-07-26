//
//  ActivityView.swift
//  SwiftApp
//
//  Created by Марк Клименко on 25/07/2024.
//

import Foundation
import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let activityController = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities
        )
        
        return activityController
    }
    
    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {
    }
}
