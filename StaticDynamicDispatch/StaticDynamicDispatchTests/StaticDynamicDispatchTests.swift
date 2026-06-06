//
//  StaticDynamicDispatchTests.swift
//  StaticDynamicDispatchTests
//
//  Created by Swapnil Magar on 29/05/26.
//

import XCTest
@testable import StaticDynamicDispatch

final class StaticDynamicDispatchTests: XCTestCase {
    
    var sut: DispatchMethodTester!
    var john: John!
    var sam: Sam!
    
    override func setUp() {
        sut = DispatchMethodTester()
        john = John()
        sam = Sam()
    }
    
    func testDispatchTimes() {
        self.measure {
            sut.testSam(sam: sam)
//            sut.testJohn(john: john)
        }
    }

}
