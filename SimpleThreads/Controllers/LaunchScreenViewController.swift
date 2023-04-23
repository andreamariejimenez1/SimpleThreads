//
//  LaunchScreenViewController.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 4/23/23.
//

import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {
    
    let loadingSpinner: LottieAnimationView = {
        let spinner = LottieAnimationView(name: "whiteSpinner")
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.loopMode = .loop
        spinner.animationSpeed = 1.0
        return spinner
    }()
    
    let expandingCircleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var height: NSLayoutConstraint!
    var width: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLoadingAnimationConstraints()
        configureExpandingCircleView()
        loadingSpinner.play()
        animateCircle()
        
        // Hard coding the timing to make it easier
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.25) {
            NotificationCenter.default.post(name: Notifications.showHome, object: nil)
        }
    }
    
    private func configureLoadingAnimationConstraints() {
        view.addSubview(loadingSpinner)
        
        NSLayoutConstraint.activate([
            loadingSpinner.heightAnchor.constraint(equalToConstant: 200),
            loadingSpinner.widthAnchor.constraint(equalToConstant: 200),
            loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingSpinner.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureExpandingCircleView() {
        view.addSubview(expandingCircleView)
        
        height = expandingCircleView.heightAnchor.constraint(equalToConstant: 25)
        width = expandingCircleView.widthAnchor.constraint(equalToConstant: 25)
        
        NSLayoutConstraint.activate([
            expandingCircleView.centerXAnchor.constraint(equalTo: loadingSpinner.centerXAnchor),
            expandingCircleView.centerYAnchor.constraint(equalTo: loadingSpinner.centerYAnchor),
            height,
            width
        ])
        expandingCircleView.layer.cornerRadius = 25 / 2
    }
    
    private func animateCircle() {
        let expansionMultiplier = self.view.frame.size.height * 2
        UIView.animate(withDuration: 0.5, delay: 3) {
            self.height.constant = expansionMultiplier
            self.width.constant = expansionMultiplier
            self.expandingCircleView.layer.cornerRadius = expansionMultiplier / 2
            self.expandingCircleView.layoutIfNeeded()
        }
    }
}
