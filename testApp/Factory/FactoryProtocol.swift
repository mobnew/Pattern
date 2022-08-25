//
//  FactoryProtocol.swift
//  testApp
//
//  Created by Alexey Kurazhov on 11.08.2022.
//

import UIKit

protocol Excersise {
    var name: String {get}
    var type: String {get}
    
    func start()
    func stop()
}
