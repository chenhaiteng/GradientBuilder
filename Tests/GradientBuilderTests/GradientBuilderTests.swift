    import XCTest
    import SwiftUI
    @testable import GradientBuilder

    func createGradient(@GradientBuilder builder: ()->Gradient) -> Gradient {
        return builder()
    }
    
    func logSeperate() {
        print("----")
    }
    
    final class GradientBuilderTests: XCTestCase {
        func testBuilder() {
            let basic_g = createGradient {
                Color.red
                Color.blue
            }
            XCTAssertEqual(basic_g.stops[0].color, Color.red)
            XCTAssertEqual(basic_g.stops[1].color, Color.blue)
            logSeperate()
            
            let flag_true = true
            let flag_false = false
            
            let if_true_g = createGradient {
                if flag_true {
                    Color.red
                } else {
                    Color.blue
                }
            }
            XCTAssertEqual(if_true_g.stops[0].color, Color.red)
            logSeperate()
            
            let if_false_g = createGradient {
                if flag_false {
                    Color.red
                } else {
                    Color.blue
                }
            }
            XCTAssertEqual(if_false_g.stops[0].color, Color.blue)
            logSeperate()
            
            let array_g = createGradient {
                for _ in 0...2 {
                    Color.red
                }
            }
            
            XCTAssertEqual(array_g.stops.count, 3)
            
            for i in 0...2 {
                XCTAssertEqual(Color.red, array_g.stops[i].color)
            }
            
            logSeperate()
            
            let available_g = createGradient {
                if #available(macOS 11, *) {
                    Color.red
                }
            }
            
            XCTAssertEqual(available_g.stops[0].color, Color.red)
            
            logSeperate()
            
            let not_available_g = createGradient {
                if #available(macOS 13, *) {
                    Color.red
                } else {
                    Color.blue
                }
            }
            
//            XCTAssertEqual(not_available_g.stops.count, 0)
            XCTAssertEqual(not_available_g.stops[0].color, Color.blue)
            
            logSeperate()
        }
    }
