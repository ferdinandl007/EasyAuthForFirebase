# EasyAuthForFirebase
a really easy inconvenient way integrating firebase authentication into your project 
Just put the Swift file into your project and the way easier way to integrate Firebase into your project as well the error handling being taken care for you!☺️
The class is entirely written in swift 3 😉 
Now you can just call the class like this 
```AuthProvider.Internal.login(withEmail: emailTextField.text!, password: passwordTextField.text!, loginHandler: {(message) in
                if message != nil {
                    self.alertTheUser(title: "Problem with Authentication", message: message!)
                } else {
                    self.emailTextField.text = ""`
                    self.passwordTextField.text = ""
                    print("login") 
                }
            })

```


I recommend adding this function for the error alerts to the user
```
 private func  alertTheUser(title: String,message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true,completion: nil)
    }
    ```
    Hope this class will save you sometime! 
