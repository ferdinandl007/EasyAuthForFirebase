//
//  AuthProvider.swift
//  Uber for driver
//
//  Created by Ferdinand Lösch on 26/11/2016.
//  Copyright © 2016 Ferdinand Lösch. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias LoginHandler = (_ msg: String?) -> Void


// structure containing possible responses for eventual errors
struct LoginErrorCode {
    static let INVALID_EMAIL = "Invalid email address, Please provide a real email address"
    static let WRONG_PASSWORD = "Wrong password, Please enter the correct password"
    static let PROBLEM_CONNECTING = " Problem Connecting to the Database, Are You Connected to the Internet?"
    static let EMAIL_ALREADY_IN_USE = " Email Address Already In Use, Please Use Another Email Address"
    static let WEAK_PASSWORD = "Password Should Be At Least Six Characters Long"
    static let USER_NOT_FOUND = "User Not Found, Please Register"
}
    


class AuthProvider {
    private static let _instance = AuthProvider()
    
    static var Internal: AuthProvider {
        return _instance
    }
    
    func login(withEmail: String,password: String, loginHandler: LoginHandler?) {
            FIRAuth.auth()?.signIn(withEmail: withEmail, password: password, completion: {(user, error) in
            if error != nil {
               self.handelErrors(err: error as! NSError, loginHandler: loginHandler)
                
            } else {
                loginHandler?(nil)
            }
            
        })
      
    }// login func
    
    func signUp(withEmail: String,password: String, loginHandler: LoginHandler?){
        FIRAuth.auth()?.createUser(withEmail: withEmail, password: password, completion: {(user,error) in
            if error != nil {
                self.handelErrors(err: error as! NSError, loginHandler: loginHandler)
            } else {
                if user?.uid != nil {
                   
                    // sign in the user 
                    self.login(withEmail: withEmail, password: password, loginHandler: loginHandler)
                } else {
                    loginHandler?(nil)
                }
                
            }
        
        })
        
    }// sign up func
    
    func logOut() -> Bool {
        if FIRAuth.auth()?.currentUser != nil {
            do {
                try FIRAuth.auth()?.signOut()
                return true
            } catch {
                return false
            }
        }
        return true
    }// log out func

  
    private func handelErrors(err: NSError, loginHandler: LoginHandler? ){
        if let errCode = FIRAuthErrorCode(rawValue: err.code) {
            
            switch errCode {
            case .errorCodeWrongPassword:
                loginHandler?(LoginErrorCode.WRONG_PASSWORD)
                break
            case .errorCodeInvalidEmail:
                loginHandler?(LoginErrorCode.INVALID_EMAIL)
                break
            case .errorCodeUserNotFound:
                loginHandler?(LoginErrorCode.USER_NOT_FOUND)
                break
            case .errorCodeWeakPassword:
                loginHandler?(LoginErrorCode.WEAK_PASSWORD)
                break
             default:
                loginHandler?(LoginErrorCode.PROBLEM_CONNECTING)
                break
            }
            
        }
        
    }// function to handle the errors

} // clase
