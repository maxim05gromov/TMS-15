//
//  CustomAlertView.swift
//  HW15
//
//  Created by Максим Громов on 07.08.2024.
//

import UIKit
struct CustomAlertAction {
    var color: UIColor
    var text: String
    var action: () -> ()
}
class MyTapGestureRecognizer: UITapGestureRecognizer{
    let handler: () -> Void
    init(handler: @escaping () -> Void) {
        self.handler = handler
        super.init(target: nil, action: nil)
        addTarget(self, action: #selector(handle))
    }
    @objc private func handle(){
        handler()
    }
}
class CustomAlertView: UIView {
    var title: String?
    var contentText: String?
    var actions: [CustomAlertAction] = []
    
    private var titleLabel = UILabel()
    private var contentLabel = UILabel()
    private var actionsStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func configure(title: String, text: String, actions: [CustomAlertAction]){
        self.title = title
        self.actions = actions
        self.contentText = text
        
        layer.shadowOffset = .init(width: 2, height: 2)
        layer.shadowRadius = 3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.cornerRadius = 10
        backgroundColor = .lightGray
        
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentLabel)
        contentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        contentLabel.text = text
        
        actionsStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(actionsStackView)
        actionsStackView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        actionsStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        actionsStackView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        actionsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        actionsStackView.spacing = 5
        actionsStackView.axis = .horizontal
        actionsStackView.distribution = .fillEqually
        
        contentLabel.bottomAnchor.constraint(equalTo: actionsStackView.topAnchor, constant: -10).isActive = true
        
        for a in actions{
            let actionView = UIView()
            let actionLabel = UILabel()
            actionView.addSubview(actionLabel)
            actionView.layer.cornerRadius = 10
            actionView.backgroundColor = a.color
            actionLabel.translatesAutoresizingMaskIntoConstraints = false
            actionLabel.topAnchor.constraint(equalTo: actionView.topAnchor).isActive = true
            actionLabel.bottomAnchor.constraint(equalTo: actionView.bottomAnchor).isActive = true
            actionLabel.leadingAnchor.constraint(equalTo: actionView.leadingAnchor).isActive = true
            actionLabel.trailingAnchor.constraint(equalTo: actionView.trailingAnchor).isActive = true
            actionLabel.text = a.text
            actionLabel.textAlignment = .center
            let recognizer = MyTapGestureRecognizer(handler: a.action)
            actionView.addGestureRecognizer(recognizer)
            actionsStackView.addArrangedSubview(actionView)
        }
        
    }
    

}
