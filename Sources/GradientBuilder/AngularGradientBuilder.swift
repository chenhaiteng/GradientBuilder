//
//  AngularGradientBuilder.swift
//
//
//  Created by Chen Hai Teng on 1/25/24.
//

import SwiftUI

public extension AngularGradient {
    init(center: UnitPoint = .center, angle: Angle = .zero, @GradientBuilder _ builder: ()-> Gradient ) {
        self.init(gradient: builder(), center: center, angle: angle)
    }
    
    init(center: UnitPoint = .center, startAngle: Angle = .zero, endAngle: Angle = .zero, @GradientBuilder _ builder: ()-> Gradient) {
        self.init(gradient: builder(), center: center, startAngle: startAngle, endAngle: endAngle)
    }
}

#Preview {
    AngularGradient {
        Color.red
        Color.green
        Color.blue
    }
}
