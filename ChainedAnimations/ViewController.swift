//
//  ViewController.swift
//  ChainedAnimations
//
//  Created by Hugo de Groot on 17/06/2019.
//  Copyright © 2019 Hugo de Groot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel = UILabel()
    let bodyLabel = UILabel()

    fileprivate func setupLabels() {
        titleLabel.text = "Welcome"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Futura", size: 34)
        bodyLabel.numberOfLines = 0
        bodyLabel.text = "Hi there! Thanks for downloading this "
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,
                                                       bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        view.addSubview(stackView)
        
        //enables auto layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()

        setupStackView()
        
        //animations
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations)))
        
    }

    @objc fileprivate func handleTapAnimations() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -350)
            })
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -350)
            })
        }
    }

}

