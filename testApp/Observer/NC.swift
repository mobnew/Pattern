//
//  NC.swift
//  testApp
//
//  Created by Alexey Kurazhov on 11.08.2022.
//

import UIKit

class NC {
    
    static let shared = NC()
    
    var message: String = "nil"
    
    private lazy var observers = [Observer]()
    
    func subscribe(observer: Observer) {
        observers.append(observer)
        print(#function)
    }
    
    func unSubscribe(observer: Observer) {
        print(#function)
        
        guard let index = observers.firstIndex(where: {$0 === observer})
        else { return }
        observers.remove(at: index)
    }
    
    func notyfy() {
        observers.forEach({$0.update(subject: self)})
    }
    
    func testLogic() {
        print(#function)
        message = "Message from observer"
        notyfy()
        
        print(observers.count)
    }
    
}
