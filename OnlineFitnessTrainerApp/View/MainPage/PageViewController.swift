//
//  PageViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/28/23.
//

import UIKit

final class PageViewController: UIViewController {
    
    fileprivate var manager = PageViewModelManager()
    
    // MARK:- ViewController lifecycle
    override func loadView() {
        super.loadView()
        self.view = PageView(posterImage: "Page1",
                             text: "Find The right workout for what you need",
                             delegate: self
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- FilePrivate methods
    fileprivate func changeVIewWithAnimation() {
        guard let pageViewModel = manager.getNextPage() else { return }
        
        UIView.transition(with: self.view, duration: 1, options: [.transitionCurlUp]) {
        } completion: { _ in
            (self.view as! PageView).updateViewComponents(with: pageViewModel)
        }
        
        //        UIView.animate(withDuration: 1, delay: 0.3, options: [.curveEaseIn]) {
        ////                    self.view.alpha = 0.1
        //                } completion: { _ in
        //                    UIView.animate(withDuration: 1, animations: {
        ////                        self.view.alpha = 1
        //                         (self.view as! PageView).updateViewComponents(with: pageViewModel)
        //                    }, completion: nil)
        //                }
    }
}
// MARK:- Extension
extension PageViewController: Listener {
    func buttonPressd(_ sender: UIButton?) {
        if manager.getPageIndex() < 2 {
            changeVIewWithAnimation()
        } else {
            self.navigationController?.pushViewController(GetInViewController(), animated: true)
        }
    }
}

