//
//  AccountInformation.swift
//  SimpleThreads
//
//  Created by Andrea Jimenez on 4/14/23.
//

import Foundation

enum Title: String {
    case name = "NAME"
    case email = "EMAIL"
    case password = "PASSWORD"

}

struct AccountInformation {
    var title: Title
    var data: String
    
    static let accountSampleData = [
        AccountInformation(title: .name, data: "Andrea Jimenez"),
        AccountInformation(title: .email, data: "andreajimenez@gmail.com"),
        AccountInformation(title: .password, data: "********")
    ]
}
