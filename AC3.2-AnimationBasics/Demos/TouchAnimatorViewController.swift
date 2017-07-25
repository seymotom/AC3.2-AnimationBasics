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
    
    var dynamicAnimator: UIDynamicAnimator? = nil
    
    let squareSize = CGSize(width: 100.0, height: 100.0)
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewHierarchy()
        configureConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.dynamicAnimator = UIDynamicAnimator(referenceView: view)
        let gravitiyBehavior = UIGravityBehavior(items: [darkBlueView])
        self.dynamicAnimator?.addBehavior(gravitiyBehavior)
        
        let collisionBehavior = UICollisionBehavior(items: [darkBlueView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        self.dynamicAnimator?.addBehavior(collisionBehavior)
        
        let elasticBehavior = UIDynamicItemBehavior(items: [darkBlueView])
        elasticBehavior.elasticity = 0.5
        self.dynamicAnimator?.addBehavior(elasticBehavior)
        
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
        
//        view.snp.remakeConstraints { (view) in
//            view.center.equalTo(point)
//            view.size.equalTo(squareSize)
//        }
//        let animator = UIViewPropertyAnimator(duration: 0.2, dampingRatio: 0.9) {
//            self.view.layoutIfNeeded()
//        }
//        animator.startAnimation()
        _ = self.dynamicAnimator?.behaviors.map {
            if $0 is UISnapBehavior {
                self.dynamicAnimator?.removeBehavior($0)
            }
        }
        
        let snapBehavior = UISnapBehavior(item: view, snapTo: point)
        snapBehavior.damping = 1
        self.dynamicAnimator?.addBehavior(snapBehavior)
        
        
    }
    
    /*
     func snapToCenter() {
     let snapBehavior = UISnapBehavior(item: blueView, snapTo: self.view.center)
     snapBehavior.damping = 1
     snapBehavior.addChildBehavior(UISnapBehavior(item: redView, snapTo: self.view.frame.origin))
     self.dynamicAnimator?.addBehavior(snapBehavior)
     }

 */
    
    
    func pickUp(view: UIView) {
        self.animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeIn, animations: {
            self.darkBlueView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        })
        self.animator?.startAnimation()
        
    }
    
    func putDown(view: UIView) {
        self.animator = UIViewPropertyAnimator(duration: 0.1, curve: .easeOut, animations: {
            self.darkBlueView.transform = CGAffineTransform.identity
        })
        self.animator?.startAnimation()
        
    }
    
    
    // MARK: - Tracking Touches
    
    var touchBegan: Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self.view)
        print("Touch at: \(touchLocation)")
        
        if darkBlueView.frame.contains(touchLocation) {
            touchBegan = true
            pickUp(view: darkBlueView)
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            print("No touching!")
            return
        }
        
        let touchLocationInView = touch.location(in: view)
        if darkBlueView.frame.contains(touchLocationInView) || touchBegan {
            move(view: darkBlueView, to: touchLocationInView)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        putDown(view: darkBlueView)
        touchBegan = false
        _ = self.dynamicAnimator?.behaviors.map {
            if $0 is UISnapBehavior {
                self.dynamicAnimator?.removeBehavior($0)
            }
        }

    }
    
    
    
    // MARK: - Views
    internal lazy var darkBlueView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = Colors.orange
                view.layer.shadowColor = UIColor.black.cgColor
                view.layer.shadowOpacity = 0.7
                
                view.layer.shadowRadius = 4
        return view
    }()
}
