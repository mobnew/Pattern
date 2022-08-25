//
//  Settings.swift
//  testApp
//
//  Created by Alexey Kurazhov on 09.08.2022.
//

import UIKit


class Settings {
    
    static var shared = Settings()
    
    private init () {}
    
    var address: String = "192.168.1.1"
    var port: Int = 4242
    
}
