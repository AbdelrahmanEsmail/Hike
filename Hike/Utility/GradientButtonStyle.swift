//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Abdelrahman Esmail on 16/08/2023.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 30)
            .padding(.vertical)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            configuration.isPressed ? Color.customGrayMedium : Color.customGrayLight,
                            configuration.isPressed ? Color.customGrayLight : Color.customGrayMedium
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(40)
    }
}

