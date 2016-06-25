//
//  LoginViewController.swift
//  Parking
//
//  Created by Johnny Parham on 6/25/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate, SignUpVCDelegate {
    @IBOutlet weak var logo: UIImageView!

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet var activityView: ActivityView!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    var activityViewVisible: Bool {
        get {
            return !self.activityView.hidden
        }
        set {
//            self.activityView.hidden = !newValue
//            newValue ? self.activityView.activityIndicator.startAnimating() : self.activityView.activityIndicator.stopAnimating()
        }
    }
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonBorders()
        self.usernameField.delegate = self
        self.passwordField.delegate = self
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        tapGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewWillAppear(animated: Bool) {
        if let navigation = self.navigationController {
            navigation.navigationBarHidden = true
        }
        activityViewVisible = false
//        activityView.setUpView()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "toSignUp" {
                let signUpVC = segue.destinationViewController as! SignUpViewController
                signUpVC.delegate = self
            }
        }
    }
    
    func addButtonBorders() {
        loginButton.layer.borderWidth = 2.0
        loginButton.layer.borderColor = UIColor.whiteColor().CGColor
        loginButton.layer.cornerRadius = 30.0
        signupButton.layer.borderWidth = 2.0
        signupButton.layer.borderColor = UIColor.whiteColor().CGColor
        signupButton.layer.cornerRadius = 30.0
    }
    
    // MARK: - Logging In
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.usernameField { self.passwordField.becomeFirstResponder() }
        if textField == self.passwordField { self.passwordField.resignFirstResponder(); self.processEntries() }
        return true
    }
    
    //may have to hook this up again
    @IBAction func logInPressed(sender: AnyObject) {
        self.dismissKeyboard()
        self.processEntries()
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func processEntries() {
        let username = self.usernameField.text
        let password = self.passwordField.text
        let noUserNameText = "username"
        let noPasswordText = "password"
        var errorText = "No "
        let errorTextJoin = " or "
        let errorTextEnding = " entered"
        var textError = false
        
        if username?.length == 0 || password?.length == 0 {
            textError = true
            if password?.length == 0 { self.passwordField.becomeFirstResponder() }
            if username?.length == 0 { self.usernameField.becomeFirstResponder() }
        }
        if username?.length == 0 { errorText += noUserNameText }
        if password?.length == 0 {
            if username?.length == 0 { errorText += errorTextJoin }
            errorText += noPasswordText
        }
        if textError {
            errorText += errorTextEnding
            let alertView = UIAlertView(title: errorText, message: "", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "OK")
            alertView.show()
            return
        }
        
        //everything was ok
        self.attemptToLogInWith(username!, andPassword: password!)
    }
    
    func attemptToLogInWith(username: String, andPassword password: String) {
        self.activityViewVisible = true
        PFUser.logInWithUsernameInBackground(username, password: password) {
            user, error in
            self.activityViewVisible = false
            if user != nil { self.loggingIn() }
            else {
                var alertTitle = ""
                if error != nil {
                    let errorDict = error!.userInfo
                    let errorString = errorDict["error"] as! String
                    alertTitle = errorString
                } else { alertTitle = "Couldnt log in: username or password was wrong" }
                let alertView = UIAlertView(title: alertTitle, message: "", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "OK")
                alertView.show()
                self.usernameField.becomeFirstResponder()
            }
        }
    }
    
    func loggingIn() {
        if let navigation = self.navigationController {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //let wallVC = storyboard.instantiateViewControllerWithIdentifier("wallVC") as! WallViewController
            //navigation.setViewControllers([wallVC], animated: true)
        }
    }
    
    // MARK: - SignUpVCDelegate
    
    func userSignedUp() { self.loggingIn() }
    
    // MARK: IBActions 
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        prepareToLeaveViewController()
    }
    
    
    func prepareToLeaveViewController() {
        UIView.animateWithDuration(0.6) {
            self.loginButton.transform = CGAffineTransformMakeRotation(CGFloat((360 + 180) * M_PI/180))
            self.signupButton.transform = CGAffineTransformMakeRotation(CGFloat((360 + 180) * M_PI/180))
        }
        
        UIView.animateWithDuration(0.6, delay: 0.2, options: UIViewAnimationOptions.CurveEaseIn, animations: { 
            self.loginButton.alpha = 0
            self.signupButton.alpha = 0
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.usernameField.transform = CGAffineTransformMakeScale(0.6, 1)
            self.passwordField.transform = CGAffineTransformMakeScale(0.6, 1)
            self.logo.transform = CGAffineTransformMakeScale(1.5, 1.5)
            
        }) { (bool) in
            UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0,
               options:UIViewAnimationOptions.CurveEaseOut, animations: {
                self.usernameField.transform = CGAffineTransformMakeScale(1, 1)
                self.passwordField.transform = CGAffineTransformMakeScale(1, 1)
                self.logo.transform = CGAffineTransformMakeScale(0.2, 0.2)
                
                
                UIView.animateWithDuration(0.2, delay: 0.1, options: UIViewAnimationOptions.CurveLinear, animations: {
                    self.logo.alpha = 0
                    self.usernameField.alpha = 0
                    self.passwordField.alpha = 0
                }, completion: { (bool) in
                    self.performSegueWithIdentifier("MainViewControllerSegue", sender: nil)

                })
            }, completion: { (bool) in
                    
            })
        }
    }
    
}
