    import XCTest
    import SwiftUI
    @testable import GradientBuilder

    func createGradient(@GradientBuilder builder: ()->Gradient) -> Gradient {
        return builder()
    }
    
    func logSeperate() {
        print("----")
    }
    
    enum GrayGradient {
        @GradientBuilder static subscript(_ degree: Int) -> Gradient {
            if degree > 0 {
                for i in 0..<degree {
                    Color.white.opacity(Double(i)/Double(degree))
                }
            } else {
                Color.white
            }
        }
    }
    
    final class GradientBuilderTests: XCTestCase {
        func testBuilder() {
            
            let empty_g = createGradient {
                
            }
            XCTAssertTrue(empty_g.stops.isEmpty)
            
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
                (1.0,1.0,1.0,1.0)
                if #available(macOS 13, *) {
                    Color.red
                } else {
                    Color.blue
                }
                (255, 255, 255, 255)
            }
            
            XCTAssertEqual(not_available_g.stops[1].color, Color.blue)
            
            logSeperate()
            
            let stop_g = createGradient {
                (Color.red, 0.0)
                (Color.blue, 0.5)
                (Color.yellow, 1.0)
            }
            XCTAssertEqual(stop_g.stops.count, 3)
            XCTAssertEqual(stop_g.stops[0].color, Color.red)
            
            logSeperate()
            
            let stop_if_true_g = createGradient {
                if flag_true {
                    Gradient.Stop(color: .red, location: 0.2)
                    (.blue, 0.5)
                    (.yellow, 1.0)
                } else {
                    (.blue, 0.0)
                    (.yellow, 1.0)
                    (.red, 0.0)
                }
            }
            XCTAssertEqual(stop_if_true_g.stops.count, 3)
            XCTAssertEqual(stop_if_true_g.stops[0].color, Color.red)
            
            logSeperate()
            
            let stop_if_false_g = createGradient {
                if flag_false {
                    (Color.red, 0.0)
                    (Color.blue, 0.5)
                    (Color.yellow, 1.0)
                } else {
                    (Color.blue, 0.0)
                    (Color.yellow, 1.0)
                }
            }
            XCTAssertEqual(stop_if_false_g.stops.count, 2)
            XCTAssertEqual(stop_if_false_g.stops[0].color, Color.blue)
            
            logSeperate()
            
            let gray_g = GrayGradient[3]
            XCTAssertEqual(gray_g.stops.count, 3)
            
            logSeperate()
        }
    }
