# EasyAuthForFirebase
a really easy inconvenient way integrating firebase authentication into your project 
Just put the Swift into your project and the way easier way to integrate Firebase into your project as well the error handling being taken care for you!☺️

Now you can just call the class like this 
` @IBAction func logIn(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            AuthProvider.Internal.login(withEmail: emailTextField.text!, password: passwordTextField.text!, loginHandler: {(message) in
                if message != nil {
                    self.alertTheUser(title: "Problem with Authentication", message: message!)
                } else {
                    UberHandler.Instance.driver = self.emailTextField.text!
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    print("login")
                    self.performSegue(withIdentifier: self.DRIVER_SEGUE, sender: nil)
                    
                }
            })
            
        }else {
            alertTheUser(title: "Email and Password is required", message: " please fill in the email and  password fields")
        }
        
  
    }
`
