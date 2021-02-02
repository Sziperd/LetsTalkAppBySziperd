//
//  ViewController.swift
//  LetsTalkApp
//
//  Created by Patryk Piwowarczyk on 01/02/2021.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
        
        
        view.backgroundColor = .gray
        //so we can disambiguate it from the other screen for now
    }

    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
        
        if !isLoggedIn {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen // this animation of a new screen comes up from the bottom and can be dismissed. We dont want the login screen to be dismissed so i make it come as fullscreen...
            present(nav, animated: true) // FLAGGG moze to zmienic na false kiedys..
        }
        
    }
    
    //check if the user is signed in, if not show register screen
    
    

}

