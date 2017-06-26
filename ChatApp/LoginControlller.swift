//
//  LoginControlller.swift
//  ChatApp
//
//  Created by Lamond Dixon on 6/15/17.
//  Copyright © 2017 Lamond Dixon. All rights reserved.
//

import UIKit

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
    return button
  }()

    override func viewDidLoad() {
      super.viewDidLoad()

      view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
      view.addSubview(inputsContainerView)
      view.addSubview(loginRegisterButton)
     
      setupInputsContainerView()
      setupLoginRegisterButton()
    }
  
  
  func setupInputsContainerView() {
     //need x, y width, height, constaraints
      inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
      inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
      inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
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
