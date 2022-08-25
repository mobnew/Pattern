//
//  ViewData.swift
//  testApp
//
//  Created by Alexey Kurazhov on 18.08.2022.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case succsess(Data)
    case falture(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let phoneNumber: String?
    }
}
