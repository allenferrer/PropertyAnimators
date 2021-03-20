//
//  ViewController.swift
//  PropertyAnimators
//
//  Created by ops on 3/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var block: UIView!
    
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupAnimation()
        
    }

    func setupAnimation() {
        animator = UIViewPropertyAnimator(duration: 1.2, curve: UIView.AnimationCurve.linear, animations: {
            let screenWidth = self.view.frame.size.width
            let blockWidth = self.block.frame.size.width
            self.block.frame.origin.x = screenWidth - blockWidth
        })
    }
    
    @IBAction func startAnimation(_ sender: Any) {
        animator.startAnimation()
    }
}

