//
//  ViewController.swift
//  StaticDynamicDispatch
//
//  Created by Swapnil Magar on 29/05/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

class Sam {
    func doTheJob() {
        print("Job done")
    }
}

final class John {
    func doTheJob() {
        print("Job done by John")
    }
}

class DispatchMethodTester {
    
    func testJohn(john: John) {
        john.doTheJob()
    }
    
    func testSam(sam: Sam) {
        sam.doTheJob()
    }
}
