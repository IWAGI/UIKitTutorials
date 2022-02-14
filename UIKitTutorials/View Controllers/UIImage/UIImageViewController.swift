//
//  UIImageViewController.swift
//  UIKitTutorials
//
//  Created by Mikhail on 12.02.2022.
//

import UIKit

class UIImageViewController: UIViewController {
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage.init(systemName: "xmark"), for: .normal)
        
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.white.cgColor
        
        image.image = UIImage.init(named: "1")
        
        image.animationDuration = 8
        image.animationImages = [UIImage(named: "1")!,
                                 UIImage(named: "2")!,
                                 UIImage(named: "3")!,
                                 UIImage(named: "4")!]
        return image
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let stopButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
//    private let image = UIImage.animatedImage(with: [UIImage(named: "1")!,
//                                                     UIImage(named: "2")!,
//                                                     UIImage(named: "3")!,
//                                                     UIImage(named: "4")!],
//                                              duration: 8)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInterface(for: startButton, withAction: "Старт")
        setupInterface(for: stopButton, withAction: "Стоп")
        
        setupLayout()
        setupView()
//        setupMainImage()
//        animation()
    }
    
    private func setupLayout() {
        view.backgroundColor = #colorLiteral(red: 0.01595304161, green: 0.01591830701, blue: 0.005867039319, alpha: 1)
        view.addSubview(closeButton)
        view.addSubview(mainImage)
        view.addSubview(startButton)
        view.addSubview(stopButton)
    }
    
    private func setupView() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            startButton.widthAnchor.constraint(equalToConstant: 100),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            stopButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            stopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            stopButton.widthAnchor.constraint(equalToConstant: 100),
            stopButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
//    private func animation() {
//        UIView.animate(withDuration: 2,
//                       delay: 2,
//                       options: [.repeat, .autoreverse, .curveEaseIn],
//                       animations: {
//            self.mainImage.alpha = 0.5
//        })
//    }
    
//    private func setupMainImage() {
//        mainImage.image = image
//    }
    
    private func setupInterface(for button: UIButton, withAction action: String) {
        button.layer.cornerRadius = 25  // bad solution
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        
        button.setTitle(action, for: .normal)
        button.setTitleColor(.white, for: .normal)
    }
    
    @objc func startButtonTapped() {
        mainImage.startAnimating()
    }

    @objc func stopButtonTapped() {
        mainImage.stopAnimating()
    }

    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
}
