//
//  File.swift
//  testApp
//
//  Created by Alexey Kurazhov on 16.08.2022.
//

import UIKit

protocol Builder {
    static func createMain() -> UIViewController
}


class ModuleBuilder: Builder {
    static func createMain() -> UIViewController {
        let model = Person(firstName: "Alexei", secondName: "Kurazhov")
        let view = MainViewController()
        let presender = MainPresenter(view: view, person: model)
        view.presenter = presender
        
        return view
    }
    
    
}
