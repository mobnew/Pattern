//
//  FactoryViewController.swift
//  testApp
//
//  Created by Alexey Kurazhov on 11.08.2022.
//

import UIKit

class FactoryViewController: ViewController {
    
    var arrayExcersises = [Excersise]()
    
    private lazy var runExercise: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("run excersises", for: .normal)
        button.addTarget(self, action: #selector(runExcersises), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createExcercise(exname: .run)
        createExcercise(exname: .jump)
        
        title = "Factory"
        view.backgroundColor = .systemBackground
        
        view.addSubview(runExercise)
        
        NSLayoutConstraint.activate([
            runExercise.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            runExercise.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            runExercise.heightAnchor.constraint(equalToConstant: 50),
            runExercise.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func createExcercise(exname: Excersises) {
        let factory = FactoryExcersise()
        let newExcersise = factory.createExcersise(exName: exname)
        
        arrayExcersises.append(newExcersise)
    }
    
    func execExcersises() {
        for ex in arrayExcersises {
            ex.start()
            ex.stop()
        }
    }
    
    @objc func runExcersises() {
        execExcersises()
    }
}
