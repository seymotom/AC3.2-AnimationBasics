//
//  LoginViewController.swift
//  AC3.2-AnimationBasics
//
//  Created by Tom Seymour on 2/2/17.
//  Copyright © 2017 Access Code. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let squareSize = CGSize(width: 300.0, height: 300.0)
    
    let textFieldAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn, animations: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        setViews()
        setConstraints()
    }
    
    func setViews() {
        self.view.addSubview(helloButton)
        self.view.addSubview(logoImageView)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        
        //this is just a fancy way of ....
        //emailTextField.delegate = self
        //passwordTextField.delegate = self
        let textFields = self.view.subviews.filter{ $0 is UITextField } as! [UITextField]
        _ = textFields.map{ $0.delegate = self }
        self.helloButton.addTarget(self, action: #selector(helloButtonTapped), for: .touchUpInside)
    }
    
    func setConstraints() {
        _ = self.view.subviews.map { $0.snp.removeConstraints() }
        
        helloButton.snp.makeConstraints { (view) in
            view.center.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { (view) in
            view.centerX.equalToSuperview()
            view.bottom.equalTo(self.view.snp.top).offset(-100)
            view.size.equalTo(self.squareSize)
        }
        
        emailTextField.snp.makeConstraints { (view) in
            view.trailing.equalTo(self.view.snp.leading).offset(-100)
            view.width.equalTo(logoImageView.snp.width)
            view.top.equalTo(self.view.snp.bottom).offset(20)
        }
        
        passwordTextField.snp.makeConstraints { (view) in
            view.leading.equalTo(self.view.snp.trailing).offset(100)
            view.width.equalTo(logoImageView.snp.width)
            view.top.equalTo(self.view.snp.bottom).offset(20)
        }
        
        emailTextField.transform = CGAffineTransform(rotationAngle: 1.5 * CGFloat.pi)
        passwordTextField.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
    
    
    // actions
    
    func helloButtonTapped() {
        animateLogo()
        animateTextFields()
    }
    
    func animateLogo() {
        print("animate")
        
        logoImageView.snp.remakeConstraints { (view) in
            view.centerY.equalToSuperview().offset(-100)
            view.centerX.equalToSuperview()
        }
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: { 
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    func animateTextFields() {
        emailTextField.snp.remakeConstraints { (view) in
            view.centerX.equalToSuperview()
            view.width.equalTo(self.logoImageView.snp.width)
            view.top.equalTo(self.logoImageView.snp.bottom).offset(20)
        }
        
        passwordTextField.snp.remakeConstraints { (view) in
            view.centerX.equalToSuperview()
            view.width.equalTo(self.logoImageView.snp.width)
            view.top.equalTo(self.emailTextField.snp.bottom).offset(10)
        }
        
        textFieldAnimator.addAnimations {
            self.emailTextField.transform = CGAffineTransform.identity
            self.passwordTextField.transform = CGAffineTransform.identity
            self.view.layoutIfNeeded()
        }
        
        textFieldAnimator.startAnimation()

    }
    
    // lazy vars

    lazy var logoImageView: UIView = {
        let view = UIImageView()
        view.backgroundColor = .purple
        view.image = UIImage(named: "c4q")
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 5
        view.clipsToBounds = false
        return view
    }()
    
    lazy var emailTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "email"
        view.borderStyle = UITextBorderStyle.roundedRect
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 5
        view.clipsToBounds = false
        return view
    }()
    
    lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "password"
        view.borderStyle = UITextBorderStyle.roundedRect
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 5
        view.clipsToBounds = false
        return view
    }()
    
    lazy var helloButton: UIButton = {
        let view = UIButton()
        view.setTitle("hello", for: .normal)
        view.setTitleColor(.purple, for: .normal)
        return view
    }()
    
}
