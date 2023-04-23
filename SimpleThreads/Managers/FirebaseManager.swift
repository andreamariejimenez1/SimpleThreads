//
//  FirebaseManager.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 4/22/23.
//

import Foundation
import FirebaseAuth

final class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    var userIsAuthenticated: Bool {
        get {
            return Auth.auth().currentUser != nil
        }
    }
    
    var currentUser: User? = nil
    
    func createUser(email: String, password: String, completion: ((AuthDataResult?, Error?) -> Void)?) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    func signInUser(email: String, password: String, completion: ((AuthDataResult?, Error?) -> Void)?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
}
