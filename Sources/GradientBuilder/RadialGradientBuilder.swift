//
//  RadialGradientBuilder.swift
//
//
//  Created by Chen Hai Teng on 1/25/24.
//

import SwiftUI

public extension RadialGradient {
    init(center: UnitPoint = .center, startRadius: CGFloat = 0.0, endRadius: CGFloat = 100.0, @GradientBuilder _ builder: () -> Gradient) {
        self.init(gradient: builder(), center: center, startRadius: startRadius, endRadius: endRadius)
    }
}

#Preview {
    RadialGradient {
        Color.red
        Color.green
        Color.blue
    }
}
