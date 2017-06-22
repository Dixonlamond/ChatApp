//
//  ViewController.swift
//  ChatApp
//
//  Created by Lamond Dixon on 6/15/17.
//  Copyright © 2017 Lamond Dixon. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
  }
  
  func handleLogout() {
    let logincontroller = LoginControlller()
    
    present(logincontroller, animated: true, completion: nil)
  }
  
  enum UIStatusBarStyle : Int {
    case Default
    case LightContent
  }
  
//   func preferredStatusBarStyle() -> UIStatusBarStyle {
//    return .lightContent
  
}

