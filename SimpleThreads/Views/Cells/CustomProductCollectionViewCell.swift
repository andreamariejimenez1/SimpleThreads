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
        imageView.isSkeletonable = true
        return imageView
    }()
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        startAnimatingCell()
        installConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func startAnimatingCell() {
//        productImageView.showAnimatedGradientSkeleton()
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
