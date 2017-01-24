//
//  TouchAnimatorViewController.swift
//  AC3.2-AnimationBasics
//
//  Created by Louis Tur on 1/23/17.
//  Copyright © 2017 Access Code. All rights reserved.
//

import UIKit
import SnapKit

class TouchAnimatorViewController: UIViewController {
  
  var animator: UIViewPropertyAnimator? = nil
  let squareSize = CGSize(width: 100.0, height: 100.0)
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViewHierarchy()
    configureConstraints()
  }
  
  
  // MARK: - Setup
  private func configureConstraints() {
    darkBlueView.snp.makeConstraints{ view in
      view.center.equalToSuperview()
      view.size.equalTo(squareSize)
    }
  }
  
  private func setupViewHierarchy() {
    self.view.backgroundColor = .white
    self.view.isUserInteractionEnabled = true
    
    view.addSubview(darkBlueView)
  }
  
  
  // MARK: - Movement
  internal func move(view: UIView, to point: CGPoint) {

  }
  
  
  // MARK: - Tracking Touches
  
  
  // MARK: - Views
  internal lazy var darkBlueView: UIView = {
    let view: UIView = UIView()
    view.backgroundColor = Colors.darkBlue
    return view
  }()
}
