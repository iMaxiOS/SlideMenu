//
//  ViewController.swift
//  SlideTransition
//
//  Created by Maxim Granchenko on 2/12/19.
//  Copyright © 2019 Maxim Granchenko. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let transition = SlideInTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true, completion: nil)
    }
    
    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title
        
        switch menuType {
        case .camera:
            let backView = UIView()
            backView.backgroundColor = .red
            backView.frame = self.view.bounds
            self.view.addSubview(backView)
        case .profile:
            let backView = UIView()
            backView.frame = self.view.bounds
            backView.backgroundColor = .green
            self.view.addSubview(backView)
        default:
            let backView = UIView()
            backView.frame = self.view.bounds
            backView.backgroundColor = .yellow
            self.view.addSubview(backView)
        }
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
}
