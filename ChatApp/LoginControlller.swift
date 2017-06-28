//
//  LoginControlller.swift
//  ChatApp
//
//  Created by Lamond Dixon on 6/15/17.
//  Copyright © 2017 Lamond Dixon. All rights reserved.
//

import UIKit
import Firebase

class LoginControlller: UIViewController {
  
  let inputsContainerView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 5
    view.layer.masksToBounds = true
    return view
  }()
  
  let loginRegisterButton: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
    button.setTitle("Register", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitleColor(UIColor.white, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    
    button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    return button
  }()
  
  func handleRegister() {
    guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text
      else {
      print("Form Is Not Valid")
        return
    }
    Auth.auth().createUser(withEmail: email, password: password, completion: { ( user: User?, error) in
      
      if error != nil {
        print(error!)
        return
      }
      
      guard let uid = user?.uid else {
        return
      }
      
      //successfully authenticated user
      let ref = Database.database().reference(fromURL: "https://chatapp-43b78.firebaseio.com/")
      let usersReference = ref.child("user").child(uid)
      let values = ["name": name, "email": email]
      usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
        if err != nil {
          print(err!)
          return
        }
      
      print("Saved user successfully into Firebase database.")

    })
  })
}
  
  let nameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Name"
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  let nameSeptatorView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let emailTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Email"
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()

  
  let emailSeptatorView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  
  let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Password"
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.isSecureTextEntry = true
    return textField
  }()

  let profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "game-of-wolf.jpg")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

    override func viewDidLoad() {
      super.viewDidLoad()

      view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
      view.addSubview(inputsContainerView)
      view.addSubview(loginRegisterButton)
      view.addSubview(profileImageView)
     
      setupInputsContainerView()
      setupLoginRegisterButton()
      setupProfileImageView()
    }
  
  func setupProfileImageView() {
    //need x, y width, height, constaraints
    
    profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    profileImageView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
    profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
  }
  
  func setupInputsContainerView() {
     //need x, y width, height, constaraints
      inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
      inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
      inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    
    inputsContainerView.addSubview(nameTextField)
    inputsContainerView.addSubview(nameSeptatorView)
    inputsContainerView.addSubview(emailTextField)
    inputsContainerView.addSubview(emailSeptatorView)
    inputsContainerView.addSubview(passwordTextField)
    
     //need x, y width, height, constaraints
    nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
    nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
    nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
    
     //need x, y width, height, constaraints
    nameSeptatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
    nameSeptatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
    nameSeptatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    nameSeptatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    //need x, y width, height, constaraints
    emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
    emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
    emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
    
    //need x, y width, height, constaraints
    emailSeptatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
    emailSeptatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
    emailSeptatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    emailSeptatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true

    //need x, y width, height, constaraints
    passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
     passwordTextField.topAnchor.constraint(equalTo: emailSeptatorView.bottomAnchor).isActive = true
     passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
     passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
  }
  
  func setupLoginRegisterButton() {
    //need x, y width, height, constaraints
    loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
    loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
    loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
  }

  enum UIStatusBarStyle : Int {
    case Default
    case LightContent
  }
}
