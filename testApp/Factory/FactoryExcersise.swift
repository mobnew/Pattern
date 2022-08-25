//
//  FactoryExcersise.swift
//  testApp
//
//  Created by Alexey Kurazhov on 11.08.2022.
//

import UIKit

enum Excersises {
    case jump, run
}

class FactoryExcersise {
    
    
    func createExcersise(exName: Excersises) -> Excersise {
        switch exName {
        case .jump:
            return Jump()
        case .run:
            return Run()
        }
    }
    
    
}
