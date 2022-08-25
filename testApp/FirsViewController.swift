//
//  FirsViewController.swift
//  testApp
//
//  Created by Alexey Kurazhov on 08.08.2022.
//

import UIKit

class FirsViewController: ViewController {
    
    private lazy var swith: UISwitch = {
        let sw = UISwitch()
        sw.addTarget(self, action: #selector(touchSwich(_:)), for: .valueChanged)
        sw.translatesAutoresizingMaskIntoConstraints = false
        return sw
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Tast Label"
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelForObserver: UILabel = {
        let label = UILabel()
        label.text = "Tast Label"
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonToFactory: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Factory", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(toFactory), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonToObserver: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Observer", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(toObserver), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonToMVC: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("MVC", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(toMVC), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonToMVP: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("MVP", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(toMVP), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
        
        private lazy var buttonToMVVM: UIButton = {
            let button = UIButton()
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.setTitle("MVVM", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(toMVVM), for: .touchUpInside)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .systemBackground
            setupNavi()
            
            view.addSubview(label)
            view.addSubview(buttonToFactory)
            view.addSubview(buttonToObserver)
            view.addSubview(labelForObserver)
            view.addSubview(swith)
            view.addSubview(buttonToMVC)
            view.addSubview(buttonToMVP)
            view.addSubview(buttonToMVVM)
            
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                
                buttonToFactory.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonToFactory.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
                buttonToFactory.heightAnchor.constraint(equalToConstant: 50),
                buttonToFactory.widthAnchor.constraint(equalToConstant: 200),
                
                buttonToObserver.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonToObserver.topAnchor.constraint(equalTo: buttonToFactory.bottomAnchor, constant: 30),
                buttonToObserver.heightAnchor.constraint(equalToConstant: 50),
                buttonToObserver.widthAnchor.constraint(equalToConstant: 200),
                
                buttonToMVC.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonToMVC.topAnchor.constraint(equalTo: buttonToObserver.bottomAnchor, constant: 30),
                buttonToMVC.heightAnchor.constraint(equalToConstant: 50),
                buttonToMVC.widthAnchor.constraint(equalToConstant: 200),
                
                buttonToMVP.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonToMVP.topAnchor.constraint(equalTo: buttonToMVC.bottomAnchor, constant: 30),
                buttonToMVP.heightAnchor.constraint(equalToConstant: 50),
                buttonToMVP.widthAnchor.constraint(equalToConstant: 200),
                
                buttonToMVVM.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                buttonToMVVM.topAnchor.constraint(equalTo: buttonToMVP.bottomAnchor, constant: 30),
                buttonToMVVM.heightAnchor.constraint(equalToConstant: 50),
                buttonToMVVM.widthAnchor.constraint(equalToConstant: 200),
                
                
                labelForObserver.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                labelForObserver.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
                
                swith.bottomAnchor.constraint(equalTo: labelForObserver.topAnchor, constant: -12),
                swith.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                
            ])
        }
        
        func setupNavi() {
            title = "First"
            
            let pushButton = UIBarButtonItem(title: "Push", style: .done, target: self, action: #selector(pushButton))
            
            navigationItem.setRightBarButton(pushButton, animated: true)
        }
        
        @objc func pushButton() {
            let vc = SecondViewController()
            vc.senderDelegate = self
            navigationController?.pushViewController(vc, animated: true)
        }
        
        @objc func toFactory() {
            navigationController?.pushViewController(FactoryViewController(), animated: true)
        }
        
        @objc func toObserver() {
            navigationController?.pushViewController(ObserverViewController(), animated: true)
        }
        
        @objc func toMVC() {
            navigationController?.pushViewController(MVCViewController(), animated: true)
        }
        
        @objc func toMVP() {
            
            let mainVC = ModuleBuilder.createMain()
            navigationController?.pushViewController(mainVC, animated: true)
        }
        
        @objc func toMVVM() {
            
            //let mainVC = ModuleBuilder.createMain()
            navigationController?.pushViewController(MVVMViewController(), animated: true)
        }
        
        @objc func touchSwich(_ sender: UISwitch) {
            if sender.isOn {
                NC.shared.subscribe(observer: self)
            } else {
                NC.shared.unSubscribe(observer: self)
            }
            
        }
    }
    
    extension FirsViewController: testDelegate {
        func sendMessage(message: String) {
            label.text = message
        }
    }
    
    extension FirsViewController: Observer {
        func update(subject: NC) {
            labelForObserver.text = NC.shared.message
        }
    }
    
    
