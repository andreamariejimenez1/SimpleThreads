//
//  Configurable.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 4/9/23.
//

import UIKit

protocol Configureable where Self: UITableViewCell {
    func configure(with item: Item)
}
