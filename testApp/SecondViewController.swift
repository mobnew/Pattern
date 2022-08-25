//
//  SecondViewController.swift
//  testApp
//
//  Created by Alexey Kurazhov on 08.08.2022.
//

import UIKit

protocol testDelegate {
    func sendMessage(message: String)
}


class SecondViewController: ViewController {
    
    var senderDelegate: testDelegate?
    
    private lazy var label1: UILabel = {
       let label = UILabel()
        label.text = Settings.shared.address+": "+String(Settings.shared.port)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        view.backgroundColor = .systemBackground
        view.addSubview(button)
        view.addSubview(label1)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 250),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 16)
        ])
    }
    
    @objc func buttonPress() {
        let message = "Delegate message 545"
        senderDelegate?.sendMessage(message: message)
        navigationController?.popViewController(animated: true)
    }
    
}
