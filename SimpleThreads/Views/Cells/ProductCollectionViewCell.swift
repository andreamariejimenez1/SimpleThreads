//
//  ProductCollectionViewCell.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/13/22.
//

import UIKit
import AlamofireImage
import SkeletonView

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    let highlightedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0.1
        view.isHidden = true
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 10
        layer.cornerRadius = 10
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.2
        installConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 10).cgPath
    }
    
    private func installConstraints() {
        addSubview(highlightedView)
        NSLayoutConstraint.activate([
            highlightedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            highlightedView.trailingAnchor.constraint(equalTo: trailingAnchor),
            highlightedView.topAnchor.constraint(equalTo: topAnchor),
            highlightedView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        productNameLabel.text = ""
    }
    
    func configure(with item: Item) async {
        Task {
            let image = try? await ImageLoader.shared.fetchImage(from: item.image)
            productImage.image = image
            productNameLabel.text = item.name
        }
    }
}
