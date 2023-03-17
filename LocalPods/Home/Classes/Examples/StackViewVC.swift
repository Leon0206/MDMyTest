//
//  SearchVC.swift
//  Home
//
//  Created by zitao0206 on 2022/11/30.
//

import UIKit

open class StackViewVC: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20

        let label1 = UILabel()
        label1.text = "Welcome to StackView!"
        stackView.addArrangedSubview(label1)

        let button = UIButton()
        button.setTitle("Click me!", for: .normal)
        button.backgroundColor = .blue
        stackView.addArrangedSubview(button)

        let label2 = UILabel()
        label2.text = "Have a nice day!"
        stackView.addArrangedSubview(label2)

        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.backgroundColor = .white
    }
}
