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
    public typealias BasicExpression = Color
    public typealias Component = [BasicExpression]
    public typealias StopExpression = Gradient.Stop
    public typealias StopComponent = [StopExpression]
    public static func buildBlock() -> Component {
        return []
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        testLog("\(#function)")
        return components.flatMap { $0 }
    }
    
    public static func buildBlock(_ components: StopComponent...) -> StopComponent {
        return components.flatMap { $0 }
    }
}

public typealias ColorStop = (color: Color, location: CGFloat)
public typealias RGBA = (red:Int, green:Int, blue:Int, alpha:Int)
public typealias RGBAF = (red:Double, green:Double, blue:Double, alpha:Double)

extension Gradient.Stop {
    init(_ stop: ColorStop) {
        self.init(color: stop.color, location: stop.location)
    }
}

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
    
    public static func buildExpression(_ stop: StopExpression) -> StopComponent {
        return [stop]
    }
    
    public static func buildExpression(_ stop: ColorStop) -> StopComponent {
        return [Gradient.Stop(color: stop.color, location: stop.location)]
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
    
    public static func buildFinalResult(_ component: StopComponent) -> Gradient {
        return Gradient(stops: component)
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
    
    public static func buildEither(first component: StopComponent) -> StopComponent {
        testLog("\(#function) 2")
        return component
    }
    
    public static func buildEither(second component: StopComponent) -> StopComponent {
        testLog("\(#function) 2")
        return component
    }
    
    public static func buildOptional(_ component: StopComponent?) -> StopComponent {
        testLog("\(#function) 2")
        return component ?? []
    }
    
    public static func buildArray(_ components: [StopComponent]) -> StopComponent {
        testLog("\(#function) 2")
        return components.flatMap { $0 }
    }
    
}

extension GradientBuilder { // Availablity
    public static func buildLimitedAvailability(_ component: Component) -> Component {
        testLog("\(#function)")
        return component
    }
}
