//
//  Configurable.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 4/9/23.
//

import UIKit

protocol Configureable where Self: UITableViewCell {
    func configure(with item: Item)
    func configure(with category: Category)
}

// Optional protocols methods are done like this in swift
extension Configureable {
    func configure(with category: Category) { }
}
