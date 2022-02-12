//
//  UIButtonViewController.swift
//  UIKitTutorials
//
//  Created by Mikhail on 12.02.2022.
//

import UIKit

class UIButtonViewController: UIViewController {

    let taskLabel: UILabel = {
       let label = UILabel()
        label.textColor = #colorLiteral(red: 0.1322800517, green: 0.1597852111, blue: 0.2137688994, alpha: 1)  //#colorliteral()
        label.textAlignment = .center
        label.text = "Правда или действие?"
        label.numberOfLines = 0
        label.font = label.font.withSize(30)
        return label
    }()
    
    let trueButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(trueButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupInterface(for: actionButton, withAction: "Действие")
        setupInterface(for: trueButton, withAction: "Правда")
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(trueButton)
        view.addSubview(actionButton)
        view.addSubview(taskLabel)
    }
    
    private func setupConstraints() {
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        trueButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            taskLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            taskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            taskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            trueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            trueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            trueButton.widthAnchor.constraint(equalToConstant: 100),
            trueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            actionButton.widthAnchor.constraint(equalToConstant: 100),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func setupInterface(for button: UIButton, withAction action: String) {
        button.layer.cornerRadius = 25  // bad solution
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.backgroundColor = UIColor.lightGray.cgColor
        
        button.setTitle(action, for: .normal)
        button.setTitleColor(.black, for: .normal)
    }
    
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func trueButtonTapped() {
        taskLabel.font = taskLabel.font.withSize(20)
        taskLabel.text = Questionnaire.getTask(type: .question)
    }

    @objc func actionButtonTapped() {
        taskLabel.font = taskLabel.font.withSize(20)
        taskLabel.text = Questionnaire.getTask(type: .action)
    }
}
