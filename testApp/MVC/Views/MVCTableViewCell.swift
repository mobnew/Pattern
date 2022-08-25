//
//  MVCTableViewCell.swift
//  testApp
//
//  Created by Alexey Kurazhov on 13.08.2022.
//

import UIKit

class MVCTableViewCell: UITableViewCell {
    
    private lazy var image: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .systemBackground
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var label: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var price: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(image)
        contentView.addSubview(label)
        contentView.addSubview(price)
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            label.topAnchor.constraint(equalTo: image.topAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            
            price.bottomAnchor.constraint(equalTo: image.bottomAnchor),
            price.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ catFood: CatFood) {
        image.image = UIImage(named: catFood.imageName)
        label.text = catFood.name
        price.text = String(catFood.price)
        
    }
}
