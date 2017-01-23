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
  static let animationDuration: TimeInterval = 1.0
  
  let darkBlueAnimator = UIViewPropertyAnimator(duration: animationDuration, curve: .linear, animations: nil)
  let tealAnimator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeInOut, animations: nil)
  let yellowAnimator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeIn, animations: nil)
  let orangeAnimator = UIViewPropertyAnimator(duration: animationDuration, curve: .easeOut, animations: nil)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViewHierarchy()
    configureConstraints()
    
    addGesturesAndActions()
  }
  
  private func configureConstraints() {
    darkBlueView.snp.removeConstraints()
    tealView.snp.removeConstraints()
    yellowView.snp.removeConstraints()
    orangeView.snp.removeConstraints()
    
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
    
    resetAnimationsButton.snp.makeConstraints { (view) in
      view.centerX.equalToSuperview()
      view.top.equalTo(animateButton.snp.bottom).offset(8.0)
    }
  }
  
  private func setupViewHierarchy() {
    self.view.backgroundColor = .white
    
    self.view.addSubview(darkBlueView)
    self.view.addSubview(tealView)
    self.view.addSubview(yellowView)
    self.view.addSubview(orangeView)
    
    self.view.addSubview(animateButton)
    self.view.addSubview(resetAnimationsButton)
  }
  
  private func addGesturesAndActions() {
    self.animateButton.addTarget(self, action: #selector(animateViews), for: .touchUpInside)
    self.resetAnimationsButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
  }
  
  internal func reset() {
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
    
    darkBlueAnimator.addAnimations { 
      self.view.layoutIfNeeded()
    }
    
    darkBlueAnimator.addAnimations({ 
      self.darkBlueView.backgroundColor = Colors.red
    }, delayFactor: 0.5)
    
    
    darkBlueAnimator.startAnimation()
  }
  
  internal func animateTealViewWithSnapkit() {
    self.tealView.snp.remakeConstraints { (view) in
      view.trailing.equalToSuperview().inset(20.0)
      view.top.equalTo(self.darkBlueView.snp.bottom).offset(20.0)
      view.size.equalTo(CGSize(width: 100.0, height: 100.0))
    }
    
    tealAnimator.addAnimations { 
      self.view.layoutIfNeeded()
    }
    
    tealAnimator.startAnimation()
  }
  
  internal func animateYellowViewWithSnapkit() {
    self.yellowView.snp.remakeConstraints { (view) in
      view.trailing.equalToSuperview().inset(20.0)
      view.top.equalTo(self.tealView.snp.bottom).offset(20.0)
      view.size.equalTo(CGSize(width: 100.0, height: 100.0))
    }
    
    yellowAnimator.addAnimations {
      self.view.layoutIfNeeded()
    }
    
    yellowAnimator.startAnimation()
  }

  internal func animateOrangeViewWithSnapkit() {
    self.orangeView.snp.remakeConstraints { (view) in
      view.trailing.equalToSuperview().inset(20.0)
      view.top.equalTo(self.yellowView.snp.bottom).offset(20.0)
      view.size.equalTo(CGSize(width: 100.0, height: 100.0))
    }
    
    orangeAnimator.addAnimations {
      self.view.layoutIfNeeded()
    }
    
    orangeAnimator.startAnimation()
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
    view.backgroundColor = Colors.darkBlue
    return view
  }()
  
  internal lazy var tealView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = Colors.teal
    return view
  }()
  
  internal lazy var yellowView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = Colors.yellow
    return view
  }()
  
  internal lazy var orangeView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = Colors.orange
    return view
  }()
  
  internal lazy var animateButton: UIButton = {
    let button = UIButton(type: UIButtonType.roundedRect)
    button.setTitle("Animate", for: .normal)
    return button
  }()
  
  internal lazy var resetAnimationsButton: UIButton = {
    let button = UIButton(type: .roundedRect)
    button.setTitle("Reset", for: .normal)
    return button
  }()
  
}

