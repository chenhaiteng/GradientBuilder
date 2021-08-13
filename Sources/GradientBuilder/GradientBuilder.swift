//
//  GradientBuilder.swift
//
//  Created by Chen-Hai Teng on 2021/8/13.
//

import SwiftUI

func testLog(_ str: String) {
    #if TEST || DEBUG
    print(str)
    #endif
}

@resultBuilder
@frozen public enum GradientBuilder {
    public typealias Component = [Color]
    public typealias BasicExpression = Color
    
    public static func buildBlock(_ components: Component...) -> Component {
        testLog("\(#function)")
        return components.flatMap { $0 }
    }
}

public typealias RGBA = (red:Int, green:Int, blue:Int, alpha:Int)
public typealias RGBAF = (red:Double, green:Double, blue:Double, alpha:Double)

public func RGBAtoColor(_ rgba: RGBA) -> Color {
    return Color(red: Double(rgba.red)/255.0,
                 green: Double(rgba.green)/255.0,
                 blue: Double(rgba.blue)/255.0,
                 opacity: Double(rgba.alpha)/255.0)
}

public func RGBAFtoColor(_ rgbaf: RGBAF) -> Color {
    return Color(red: rgbaf.red, green: rgbaf.green, blue: rgbaf.blue, opacity: rgbaf.alpha)
}

extension GradientBuilder { // Expressions
    public static func buildExpression(_ color: BasicExpression) -> Component {
        testLog("\(#function): color")
        return [color]
    }
    
    public static func buildExpression(_ rgba: RGBA) -> Component {
        testLog("\(#function): rgba")
        return [RGBAtoColor(rgba)]
    }
    
    public static func buildExpression(_ rgbaf: RGBAF) -> Component {
        testLog("\(#function): rgba float")
        return [RGBAFtoColor(rgbaf)]
    }
}

extension GradientBuilder { // Final Result
    public static func buildFinalResult(_ component: Component) -> LinearGradient {
        testLog("\(#function):linear")
        return LinearGradient(gradient: Gradient(colors: component), startPoint: .leading, endPoint: .trailing)
    }
    
    public static func buildFinalResult(_ component: Component) -> AngularGradient {
        testLog("\(#function):angular")
        guard !component.isEmpty else {
            return AngularGradient(gradient: Gradient(colors: []), center: .center)
        }
        let colors = component + [component.first!]
        return AngularGradient(gradient: Gradient(colors: colors), center: .center)
    }
    
    public static func buildFinalResult(_ component: Component) -> RadialGradient {
            testLog("\(#function):radial")
            return RadialGradient(gradient: Gradient(colors: component), center: .center, startRadius: 0.0, endRadius: 30.0)
        }
    
    // For test case
    public static func buildFinalResult(_ component: Component) -> Gradient {
        testLog("\(#function):gradient")
        return Gradient(colors: component)
    }
}

extension GradientBuilder { // Control-flow
    public static func buildEither(first component: Component) -> Component {
        testLog("\(#function)")
        return component
    }
    
    public static func buildEither(second component: Component) -> Component {
        testLog("\(#function)")
        return component
    }
    
    public static func buildOptional(_ component: Component?) -> Component {
        testLog("\(#function)")
        return component ?? []
    }
    
    public static func buildArray(_ components: [Component]) -> Component {
        testLog("\(#function)")
        return components.flatMap { $0 }
    }
}

extension GradientBuilder { // Availablity
    public static func buildLimitedAvailability(_ component: Component) -> Component {
        testLog("\(#function)")
        return component
    }
}
