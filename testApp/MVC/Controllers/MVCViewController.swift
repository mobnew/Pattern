//
//  MVCViewController.swift
//  testApp
//
//  Created by Alexey Kurazhov on 13.08.2022.
//

import UIKit

class MVCViewController: ViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.rowHeight = UITableView.automaticDimension
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        table.register(MVCTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private var foodArray = [CatFood]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodArray.append(CatFood(name: "Felix", imageName: "felix", price: 100))
        foodArray.append(CatFood(name: "Wiskas", imageName: "wiskas", price: 200))
        foodArray.append(CatFood(name: "Purina one", imageName: "purinaOne", price: 300))
        foodArray.append(CatFood(name: "Perfect fit", imageName: "perfectFit", price: 400))
        
        title = "MVC"
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension MVCViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? MVCTableViewCell {
            cell.setup(foodArray[indexPath.row])
            return cell
            
        } else{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        
        let index = String(indexPath.row)
        cell.textLabel?.text = index
        return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailMVCViewController()
        vc.dataSet = foodArray[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
