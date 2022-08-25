//
//  ObserverViewController.swift
//  testApp
//
//  Created by Alexey Kurazhov on 11.08.2022.
//

import UIKit

class ObserverViewController: ViewController {
    
    private lazy var label: UILabel = {
      let label = UILabel()
        label.text = "Tast Label"
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button :UIButton = {
       let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Send Message", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //let myNC = NC()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NC.shared.unSubscribe(observer: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NC.shared.subscribe(observer: self)

        view.backgroundColor = .systemBackground
        title = "Observer"
        
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 200)
        ])
        

    }
    
    @objc func sendMessage() {
        NC.shared.testLogic()
    }
}

extension ObserverViewController: Observer {
    func update(subject: NC) {
        label.text = subject.message
    }
}
