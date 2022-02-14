//
//  UISegmentedControlViewController.swift
//  UIKitTutorials
//
//  Created by Mikhail on 14.02.2022.
//

import UIKit

class UISegmentedControlViewController: UIViewController {
    
    @IBOutlet weak var alphaValueSegmentedControl: UISegmentedControl!
    @IBOutlet weak var textureImage: UIImageView!
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.tintColor = .white
        button.setImage(UIImage.init(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.accessibilityIdentifier = "CloseButton"
        return button
    }()
    
    private let segmentedControl: UISegmentedControl = {
        
        let titlesForSegments = ["One", "Two", "Three"]
        let segmentedControl = UISegmentedControl(items: titlesForSegments)
        
        segmentedControl.backgroundColor = .darkGray
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 0.7814647555, green: 1, blue: 0.9979613423, alpha: 1)
//        segmentedControl.setWidth(50, forSegmentAt: 1)
//        segmentedControl.setTitle("LOOOOONG TITLE", forSegmentAt: 1)
//        segmentedControl.apportionsSegmentWidthsByContent = true
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Arial", size: 14)!,
            NSAttributedString.Key.foregroundColor: UIColor.black],
            for: .normal)
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "Arial", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.black],
            for: .selected)
        
        segmentedControl.addTarget(self, action: #selector(segmentAction(sender:)), for: .valueChanged)
        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupViews()
    }
    
    private func setupLayout() {
        
        textureImage.contentMode = .scaleAspectFill
        view.backgroundColor = #colorLiteral(red: 0.01595304161, green: 0.01591830701, blue: 0.005867039319, alpha: 1)
        view.addSubview(closeButton)
        view.addSubview(segmentedControl)
    }
    
    private func setupViews() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            segmentedControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    @IBAction func lightChangeSegmentControl() {
        switch alphaValueSegmentedControl.selectedSegmentIndex {
        case 0: changeAlphaOfTexture(value: 1)
        case 1: changeAlphaOfTexture(value: 0.75)
        case 2: changeAlphaOfTexture(value: 0.5)
        default: break
        }
    }
    
    
    @objc
    private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc
    private func segmentAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: changeTexture(for: "snow1")
        case 1: changeTexture(for: "snow2")
        case 2: changeTexture(for: "snow3")
        default: break
        }
    }

    private func changeTexture(for name: String) {
        textureImage.image = UIImage.init(named: name)
    }
    
    private func changeAlphaOfTexture(value: CGFloat) {
        textureImage.alpha = value
    }
}
