//
//  EmptyCartView.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 5/3/23.
//

import UIKit

protocol EmptyCartViewDelegate: AnyObject {
    func didSelectKeepLooking(_ emptyCartView: EmptyCartView)
}

class EmptyCartView: UIView {
    
    private let emptyCartLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.emptyCart
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private lazy var keepLookingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.baseForegroundColor = .white
        button.configuration?.baseBackgroundColor = .black
        button.configuration?.cornerStyle = .medium
        button.configuration?.attributedTitle = AttributedString(Constants.keepLooking)
        button.configuration?.attributedTitle?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.addTarget(self, action: #selector(switchTabs), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: EmptyCartViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray5
        installConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func installConstraints() {
        addSubview(emptyCartLabel)
        addSubview(keepLookingButton)
        
        NSLayoutConstraint.activate([
            emptyCartLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emptyCartLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emptyCartLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyCartLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            keepLookingButton.topAnchor.constraint(equalTo: emptyCartLabel.bottomAnchor, constant: 30),
            keepLookingButton.heightAnchor.constraint(equalToConstant: 40),
            keepLookingButton.widthAnchor.constraint(equalToConstant: 150),
            keepLookingButton.centerXAnchor.constraint(equalTo: emptyCartLabel.centerXAnchor)
        ])
    }
    
   @objc private func switchTabs() {
        delegate?.didSelectKeepLooking(self)
    }
}
