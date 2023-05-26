//
//  ViewController.swift
//  LabelAnimationTest
//
//  Created by Mashqur Habib Himel on 25/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .gray
        containerView.clipsToBounds = true
        return containerView
    }()
    
    lazy var animationLabelOne: UILabel = {
        let animationText = UILabel()
        animationText.translatesAutoresizingMaskIntoConstraints = false
        animationText.textColor = .label
        animationText.text = "Sakib is a always very kind person but if he gets angry he becomes Hulk"
        animationText.sizeToFit()
        animationText.backgroundColor = UIColor(rgb: 0xFEF4B9)
        return animationText
    }()
    
    lazy var animationLabelTwo: UILabel = {
        let animationLabel = UILabel()
        animationLabel.translatesAutoresizingMaskIntoConstraints = false
        animationLabel.textColor = .label
        animationLabel.backgroundColor = .green
        animationLabel.text = "Sakib is a always very kind person but if he gets angry he becomes Hulk"
          
        return animationLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        animateLabel()
        
    }
    
    lazy var labelConstantOne = NSLayoutConstraint(item: animationLabelOne , attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: containerView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
    lazy var labelTwoLead = NSLayoutConstraint(item: animationLabelTwo, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: animationLabelOne, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 20)
    
    private func setupUI() {
        view.addSubview(containerView)
        containerView.addSubview(animationLabelOne)
        containerView.addSubview(animationLabelTwo)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 50),
            labelConstantOne,
            animationLabelOne.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            labelTwoLead,
            animationLabelTwo.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    private func animateLabel() {
        let textOneLength = animationLabelOne.frame.size.width
        let textLenthtwo = animationLabelTwo.frame.size.width
        let containerViewLength = containerView.frame.size.width
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true, block: { timer in
            if textOneLength > containerViewLength {
                self.labelConstantOne.constant -= 1
                self.view.layoutIfNeeded()
                if textOneLength == abs(self.labelConstantOne.constant) {
                    self.labelConstantOne.constant = self.labelTwoLead.constant
                    
                }
            }
        })
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

