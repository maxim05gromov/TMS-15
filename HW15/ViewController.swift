//
//  ViewController.swift
//  HW15
//
//  Created by Максим Громов on 06.08.2024.
//

import UIKit

class ViewController: UIViewController {

    lazy var loading = CircularLoadingView(frame: .init(x: (view.frame.width - 100) / 2, y: (view.frame.height - 100) / 2, width: 100, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loading)


        loading.startAnimating()
        let alert = CustomAlertView()
        view.addSubview(alert)
        alert.configure(title: "Title", text: "Here is some content text", actions: [.init(color: .green, text: "Yes", action: {
            print("Pressed yes")
        }), .init(color: .red, text: "No", action: {
            print("Pressed no")
        })])
        alert.translatesAutoresizingMaskIntoConstraints = false
        alert.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        alert.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        alert.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        alert.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    

}

