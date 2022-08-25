//
//  MVVMViewController.swift
//  testApp
//
//  Created by Alexey Kurazhov on 21.08.2022.
//

import UIKit

class MVVMViewController: UIViewController {
    private var viewModel: MainViewModelProtocol!
    private var testView: MVVMTestView!
    
    private lazy var button: UIButton = {
       let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("start", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(startFetch), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MVVMMainViewModel()
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 200)
        
        ])
        
        createView()
        updeteView()
        
    }
    
    private func createView() {
        testView = MVVMTestView()
        
        view.backgroundColor = .systemBackground
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }
    
    private func updeteView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.testView.viewData = viewData
        }
    }
    
    @objc private func startFetch() {
        viewModel.startFetch()
    }
}
