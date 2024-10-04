//
//  GRadientBuilderPreview.swift
//  GradientBuilder
//
//  Created by Chen Hai Teng on 10/4/24.
//

import SwiftUI
import GradientBuilder

#Preview {
    VStack {
        HStack {
            LinearGradient {
                Color.red
                Color.green
                Color.blue
            }
            
            RadialGradient {
                Color.red
                Color.green
                Color.blue
            }
        }
        HStack {
            AngularGradient {
                Color.red
                Color.green
                Color.blue
            }
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
}
