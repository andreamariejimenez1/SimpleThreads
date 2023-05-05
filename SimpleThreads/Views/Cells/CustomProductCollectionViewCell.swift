//
//  CustomProductCollectionViewCell.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 5/1/23.
//

import UIKit
import SkeletonView
import AlamofireImage

class CustomProductCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "CustomProductCell"
    
    let productImageView: UIImageView = {
        let image = UIImage()
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        installConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.2
    }
    
    func configureCell(with url: String) async {
        let image = try? await ImageLoader.shared.fetchImage(from: url)
        productImageView.image = image
    }
    
    private func installConstraints() {
        contentView.addSubview(productImageView)
        
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productImageView.topAnchor.constraint(equalTo: self.topAnchor),
            productImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
