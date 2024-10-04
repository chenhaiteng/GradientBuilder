//
//  LinearGradientBuilder.swift
//
//
//  Created by Chen Hai Teng on 1/25/24.
//

import SwiftUI

public extension LinearGradient {
    init(startPoint: UnitPoint = .leading, endPoint: UnitPoint = .trailing, @GradientBuilder _ builder: () -> Gradient) {
        self.init(gradient: builder(), startPoint: startPoint, endPoint: endPoint)
    }
}
