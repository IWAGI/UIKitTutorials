//
//  UILabelViewController.swift
//  UIKitTutorials
//
//  Created by Mikhail on 11.02.2022.
//

import UIKit

class UILabelViewController: UIViewController {

    @IBOutlet weak var mainLable: UILabel!
    
   private let codeLabel: UILabel = {
       let label = UILabel()
       label.frame = CGRect(x: 24, y: 100, width: 100, height: 100)
       
       label.text = "Label from code!"
       label.textColor = .black
       label.numberOfLines = 0
       label.textAlignment = .center
       label.font = label.font.withSize(30)

       label.shadowColor = .white
       label.shadowOffset = CGSize(width: 5, height: 5)
       
       label.layer.cornerRadius = 5
       label.layer.backgroundColor = UIColor.lightGray.cgColor
       label.layer.borderColor = UIColor.black.cgColor
       label.layer.borderWidth = 2
       
       return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(codeLabel)
    }
    
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }
    
}
