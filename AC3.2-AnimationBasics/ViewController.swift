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
  static let animationDuration: TimeInterval = 2.0
  static let squareSize = CGSize(width: 100.0, height: 100.0)
  
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
  }
  
  private func addGesturesAndActions() {
    self.animateButton.addTarget(self, action: #selector(animateViews), for: .touchUpInside)
  }
  
  
  // MARK: - Animations
  
  // MARK: Property Animator
  internal func animateViews() {
    
  }
  
  internal func animateDarkBlueViewWithSnapkit() {

  }
  
  // MARK: Frames
  internal func animateDarkBlueViewWithFrames() {

  }
  
  
  // MARK: - Lazy Inits
  internal lazy var darkBlueView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = Colors.darkBlue
    return view
  }()
  
  internal lazy var animateButton: UIButton = {
    let button = UIButton(type: UIButtonType.roundedRect)
    button.setTitle("Animate", for: .normal)
    return button
  }()
  
}

