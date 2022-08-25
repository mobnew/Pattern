//
//  MVVMMainViewModel.swift
//  testApp
//
//  Created by Alexey Kurazhov on 18.08.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set }
    func startFetch()
}

class MVVMMainViewModel: MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
     
    func startFetch() {
        updateViewData?(.loading(ViewData.Data(icon: nil,
                                               title: nil,
                                               description: nil,
                                               phoneNumber: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.succsess(ViewData.Data(icon: "sucsess",
                                                          title: "Sucsess",
                                                          description: "Good",
                                                          phoneNumber: nil)))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.falture(ViewData.Data(icon: "falture",
                                                          title: "Error",
                                                          description: "Not found",
                                                          phoneNumber: nil)))
        }
    }
}
