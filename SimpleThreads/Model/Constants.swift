//
//  Constants.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 10/21/22.
//

import Foundation

/*
 This file is for all of the string constants that will be used in the app. Using a struct to store string constants means changes will only need to happend in a single file.
 
 */
// We will use the static keyword to create type variables instead of instance variables.

// Cell Identifers
struct CellIdentifiers {
    
    
    /// The cell identifier to be used in the collection view protocol methods.
    static let collectionView = "cell"
    static let collectionViewHeader = "featuredHeader"
    static let productionDetailSectionOne = "ProductDetailSectionOneCell"
    static let productionDetailSectionTwo = "ProductDetailSectionTwoCell"
    static let productionDetailSectionThree = "ProductDetailSectionThreeCell"
    static let accountTableViewCell = "accountCell"
    static let categoryCell = "categoryCell"
    static let cartCell = "cartCell"
    static let cartTotalsCell = "cartTotalsCell"
    
}

// Icons
struct Icons {
    static let person = "person.fill"
    static let email = "envelope.fill"
    static let password = "key.fill"
}

struct ViewControllers {
    
    static let signIn = "signIn"
    static let signUp = "signUp"
    static let welcomeVC = "WelcomeViewController"
    static let tabBar = "TabBarViewController"
    static let cartVC = "cartVC"
}

struct Segues {
    static let loginSegue = "LoginToApp"
    static let signupSegue = "SignUpToApp"
    static let unwindToWelcome = "unwindToWelcome"
}

/// The notification names that will sent to NotificationCenter
struct Notifications {
    static let showHome = Notification.Name("showHomeScreen")
    static let showWelcome = Notification.Name("showWelcomeScreen")
}

enum Constants {
    static let emptyCart = "You haven't added any items to your cart yet."
    static let keepLooking = "Keep Looking"
}
