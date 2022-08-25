//
//  MainPresenter.swift
//  testApp
//
//  Created by Alexey Kurazhov on 16.08.2022.
//

import Foundation


protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: (MainViewProtocol)?
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = person.firstName + " " + person.secondName
        self.view?.setGreeting(greeting: greeting)
    }
}
