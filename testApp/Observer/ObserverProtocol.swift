//
//  ObserverProtocol.swift
//  testApp
//
//  Created by Alexey Kurazhov on 11.08.2022.
//

import UIKit

protocol Observer: AnyObject {
    func update(subject: NC)
}
