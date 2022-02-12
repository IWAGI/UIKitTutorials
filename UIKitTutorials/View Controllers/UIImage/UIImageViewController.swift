//
//  UIImageViewController.swift
//  UIKitTutorials
//
//  Created by Mikhail on 12.02.2022.
//

import UIKit

class UIImageViewController: UIViewController {
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage.init(systemName: "xmark"), for: .normal)
        
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
//    private let image = UIImage.animatedImage(with: [UIImage(named: "1")!,
//                                                     UIImage(named: "2")!,
//                                                     UIImage(named: "3")!,
//                                                     UIImage(named: "4")!],
//                                              duration: 8)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainImage)
        view.addSubview(closeButton)
        setupView()
//        setupMainImage()
        mainImage.animationDuration = 8
        mainImage.animationImages = [UIImage(named: "1")!,
                                 UIImage(named: "2")!,
                                 UIImage(named: "3")!,
                                 UIImage(named: "4")!]
        mainImage.startAnimating()
        animation()
    }
    
    private func setupView() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor),
            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func animation() {
        UIView.animate(withDuration: 2,
                       delay: 2,
                       options: [.repeat, .autoreverse, .curveEaseIn],
                       animations: {
            self.mainImage.alpha = 0
        })
    }
    
//    private func setupMainImage() {
//        mainImage.image = image
//    }

    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
}
