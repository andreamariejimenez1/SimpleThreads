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

        Task {
            await downloadImagesOnFirstLaunch()
            configureExpandingCircleView()
            animateCircle()
        }
        configureLoadingAnimationConstraints()
        loadingSpinner.play()
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
        UIView.animate(withDuration: 0.3) {
            self.height.constant = expansionMultiplier
            self.width.constant = expansionMultiplier
            self.expandingCircleView.layer.cornerRadius = expansionMultiplier / 2
            self.expandingCircleView.layoutIfNeeded()
        } completion: { _ in
            // When the animation is completed show the home controller
            // If the user is already signed, take them to the home screen
            if FirebaseManager.shared.userIsAuthenticated {
                NotificationCenter.default.post(name: Notifications.showHome, object: nil)
            } else {
                NotificationCenter.default.post(name: Notifications.showWelcome, object: nil)
            }
        }
    }

    private func downloadImagesOnFirstLaunch() async {
        // Since were just loading these images into memory, we don't need to assign it
        // to anything
        let _ = await withThrowingTaskGroup(of: UIImage.self) { taskGroup in
            let urls = DataStore.items.lazy.map { $0.image }
            for url in urls {
                taskGroup.addTask {
                    try await ImageLoader.shared.fetchImage(from: url)
                }
            }
        }
    }
}
