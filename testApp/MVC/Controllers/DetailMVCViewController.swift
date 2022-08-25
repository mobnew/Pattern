//
//  DetailMVCViewController.swift
//  testApp
//
//  Created by Alexey Kurazhov on 13.08.2022.
//

import UIKit

class DetailMVCViewController: UIViewController {
    
    var dataSet: CatFood?
    
    private lazy var image: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .systemBackground
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        
        if let image2 = dataSet?.imageName {
            image.image = UIImage(named: image2)
        }
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var label: UILabel = {
       let label = UILabel()
        
        if let labelText = dataSet?.name {
            label.text = labelText
        }
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detail MVC"
        view.backgroundColor = .systemBackground
        
        view.addSubview(image)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 200),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
