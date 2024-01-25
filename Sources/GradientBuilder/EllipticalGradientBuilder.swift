//
//  EllipticalGradientBuilder.swift
//
//
//  Created by Chen Hai Teng on 1/25/24.
//

import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public extension EllipticalGradient {
    init(center: UnitPoint = .center, startRadiusFraction: CGFloat = 0.0, endRadiusFraction: CGFloat = 0.5, @GradientBuilder _ builder: () -> Gradient) {
        self.init(gradient: builder(), center: center, startRadiusFraction: startRadiusFraction, endRadiusFraction: endRadiusFraction)
    }
}

#Preview {
    VStack {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            EllipticalGradient {
                Color.red
                Color.green
                Color.blue
            }
        } else {
            // Fallback on earlier versions
            Text("EllipticalGradient unavailable")
        }
    }
}
