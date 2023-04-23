//
//  UIButton+Extension.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 4/22/23.
//

import UIKit

extension UITextField {
    
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func configureTextField(withIcon iconString: String, placeHolder text: String) {
        self.tintColor = UIColor.black
        self.setIcon(UIImage.init(systemName: "\(iconString)")!)
        self.placeholder = "\(text)"
        self.layer.borderWidth = 1.0
        self.frame.size.height = 50
        self.layer.cornerRadius = 12
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func invalidText() {
        let shakeValues = [-5, 5, -5, 5, -3, 3, -2, 2, -1, 1, 0]
        
        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        translation.timingFunction = CAMediaTimingFunction(name: .linear)
        translation.values = shakeValues
        
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = shakeValues.map { (Int(Double.pi) * $0) / 180 }
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [translation, rotation]
        animationGroup.duration = 0.5
        layer.add(animationGroup, forKey: "invalidTextInout")
        layer.borderColor = UIColor.AlertColors.red.cgColor
        layer.borderWidth = 1.0
    }
    
    func resetTextFieldToNormalState() {
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
