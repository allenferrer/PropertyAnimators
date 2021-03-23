//
//  ViewController.swift
//  PropertyAnimators
//
//  Created by ops on 3/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var block: UIView!
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    var animator: UIViewPropertyAnimator!
    
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupAnimation()
        
    }

    func setupAnimation() {
        block.transform = CGAffineTransform.identity
        block.frame.origin.x = CGFloat(0)
        animator = UIViewPropertyAnimator(duration: 1.2, curve: UIView.AnimationCurve.linear, animations: {
            let screenWidth = self.view.frame.size.width
            let blockWidth = self.block.frame.size.width
            self.block.frame.origin.x = screenWidth - blockWidth
            self.block.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        })
        animator.addCompletion { (position) in
            self.block.backgroundColor = UIColor.red
        }
        
    }
    
    @IBAction func startAnimation(_ sender: Any) {
        if animator.isRunning {
            return
        }
        switch animator.state {
        case .active:
            animator.isReversed = true
            animator.addAnimations {
                self.block.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
            }
            animator.startAnimation()
            
                break
        case .inactive:
            setupAnimation()
            animator.startAnimation()
            break
        case .stopped:
            animator.finishAnimation(at: .end)
                break
        default:
            break
        }

    }
    
    @IBAction func pauseAnimation(_ sender: Any) {
        if animator.state == .active {
            animator.pauseAnimation()
        }
    }
    
    @IBAction func stopAnimation(_ sender: Any) {
        animator.stopAnimation(true)
    }
    
    @IBAction func sliderDidChange(_ sender: Any) {
        animator.fractionComplete = CGFloat(slider.value)
    }
}

