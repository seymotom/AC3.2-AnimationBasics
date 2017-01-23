//
//  ViewController.swift
//  AC3.2-AnimationBasics
//
//  Created by Louis Tur on 1/22/17.
//  Copyright © 2017 Access Code. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViewHierarchy()
    configureConstraints()
    
    addGesturesAndActions()
  }
  
  private func configureConstraints() {
    
    // blue
    darkBlueView.snp.makeConstraints { (view) in
      view.leading.equalToSuperview().offset(20.0)
      view.top.equalToSuperview().offset(20.0)
      view.size.equalTo(CGSize(width: 100.0, height: 100.0))
    }
    
    // teal
    tealView.snp.makeConstraints { (view) in
      view.leading.equalToSuperview().offset(20.0)
      view.top.equalTo(darkBlueView.snp.bottom).offset(20.0)
      view.size.equalTo(darkBlueView.snp.size)
    }
    
    // yellow
    yellowView.snp.makeConstraints { (view) in
      view.leading.equalToSuperview().offset(20.0)
      view.top.equalTo(tealView.snp.bottom).offset(20.0)
      view.size.equalTo(darkBlueView.snp.size)
    }
    
    // orange
    orangeView.snp.makeConstraints { (view) in
      view.leading.equalToSuperview().offset(20.0)
      view.top.equalTo(yellowView.snp.bottom).offset(20.0)
      view.size.equalTo(darkBlueView.snp.size)
    }
    
    // button
    animateButton.snp.makeConstraints { (view) in
      view.centerX.equalToSuperview()
      view.bottom.equalToSuperview().inset(50.0)
      view.width.greaterThanOrEqualTo(100.0)
    }
  }
  
  private func setupViewHierarchy() {
    self.view.backgroundColor = .white
    
    self.view.addSubview(darkBlueView)
    self.view.addSubview(animateButton)
    self.view.addSubview(tealView)
    self.view.addSubview(yellowView)
    self.view.addSubview(orangeView)
  }
  
  private func addGesturesAndActions() {
    self.animateButton.addTarget(self, action: #selector(animateViews), for: .touchUpInside)
  }
  
  private func reset() {
    configureConstraints()
    self.view.layoutIfNeeded()
  }
  
  // MARK: - Animations
  
  // MARK: Property Animator
  internal func animateViews() {
    animateDarkBlueViewWithSnapkit()
    animateTealViewWithSnapkit()
    animateYellowViewWithSnapkit()
    animateOrangeViewWithSnapkit()
  }
  
  internal func animateDarkBlueViewWithSnapkit() {
    
    self.darkBlueView.snp.remakeConstraints { (view) in
      view.trailing.equalToSuperview().inset(20.0)
      view.top.equalToSuperview().offset(20.0)
      view.size.equalTo(CGSize(width: 100.0, height: 100.0))
    }
    
    let propertyAnimation = UIViewPropertyAnimator(duration: 1.0, curve: .linear) {
      self.view.layoutIfNeeded()
    }
    
    propertyAnimation.startAnimation()
    
  }
  
  internal func animateTealViewWithSnapkit() {
    self.tealView.snp.remakeConstraints { (view) in
      view.trailing.equalToSuperview().inset(20.0)
      view.top.equalTo(self.darkBlueView.snp.bottom).offset(20.0)
      view.size.equalTo(CGSize(width: 100.0, height: 100.0))
    }
    
    let propertyAnimation = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
      self.view.layoutIfNeeded()
    }
    
    propertyAnimation.startAnimation()
  }
  
  internal func animateYellowViewWithSnapkit() {
    self.yellowView.snp.remakeConstraints { (view) in
      view.trailing.equalToSuperview().inset(20.0)
      view.top.equalTo(self.tealView.snp.bottom).offset(20.0)
      view.size.equalTo(CGSize(width: 100.0, height: 100.0))
    }
    
    let propertyAnimation = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn) {
      self.view.layoutIfNeeded()
    }
    
    propertyAnimation.startAnimation()
  }

  internal func animateOrangeViewWithSnapkit() {
    self.orangeView.snp.remakeConstraints { (view) in
      view.trailing.equalToSuperview().inset(20.0)
      view.top.equalTo(self.yellowView.snp.bottom).offset(20.0)
      view.size.equalTo(CGSize(width: 100.0, height: 100.0))
    }
    
    let propertyAnimation = UIViewPropertyAnimator(duration: 1.0, curve: .easeOut) {
      self.view.layoutIfNeeded()
    }
    
    propertyAnimation.startAnimation()
  }

  
  // MARK: Frames
  internal func animateDarkBlueViewWithFrames() {
    let newFrame = self.darkBlueView.frame.offsetBy(dx: 300.0, dy: 0.0)
    
    UIView.animate(withDuration: 1.0) {
      self.darkBlueView.frame = newFrame
    }
    
  }
  
  
  // MARK: - Views
  internal lazy var darkBlueView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = UIColor(colorLiteralRed: 51.0/255.0, green: 77.0/255.0, blue: 92.0/255.0, alpha: 1.0)
    return view
  }()
  
  internal lazy var tealView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = UIColor(colorLiteralRed: 69.0/255.0, green: 178.0/255.0, blue: 157.0/255.0, alpha: 1.0)
    return view
  }()
  
  internal lazy var yellowView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = UIColor(colorLiteralRed: 239.0/255.0, green: 201.0/255.0, blue: 76.0/255.0, alpha: 1.0)
    return view
  }()
  
  internal lazy var orangeView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = UIColor(colorLiteralRed: 226.0/255.0, green: 122.0/255.0, blue: 63.0/255.0, alpha: 1.0)
    return view
  }()
  
  internal lazy var animateButton: UIButton = {
    let button = UIButton(type: UIButtonType.roundedRect)
    button.setTitle("Animate", for: .normal)
    return button
  }()
  
}

