//
//  RegisterViewController.swift
//  LetsTalkApp
//
//  Created by Patryk Piwowarczyk on 01/02/2021.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Adress.."
        
        field.leftView = UIView(frame: CGRect(x: 0, y:0, width: 5, height: 0)) //this part makes the inputed letters not stick to the border of the input field.
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done //instead of .continue na klawiaturze pokaze sie zeby enterowac dane a nie powrocic do ekranu.
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password.."
        
        field.leftView = UIView(frame: CGRect(x: 0, y:0, width: 5, height: 0)) //this part makes the inputed letters not stick to the border of the input field.
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        return field
    }()
    
    
    
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "First name.."
        
        field.leftView = UIView(frame: CGRect(x: 0, y:0, width: 5, height: 0)) //this part makes the inputed letters not stick to the border of the input field.
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Last name.."
        
        field.leftView = UIView(frame: CGRect(x: 0, y:0, width: 5, height: 0)) //this part makes the inputed letters not stick to the border of the input field.
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    
    
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true // cuts off anything that overlays the rounded corners...
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Log In"
        
        view.backgroundColor = .link
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        
        
        
        emailField.delegate = self
        passwordField.delegate = self
        
        
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(registerButton)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        
        
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(didTapChangeProfilePic))
                                           //  gesture.numberOfTouchesRequired =
                                                
        imageView.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
        
        
        
    }
    
    
    @objc private func didTapChangeProfilePic(){
                print("Change pic called")
            }

    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width-size)/2,
                                 y: 80,
                                 width: size,
                                 height: size)
        
        firstNameField.frame = CGRect(x: 30,
                                  y: imageView.bottom+10,
                                  width: scrollView.width-60,
                                  height: 52)
        lastNameField.frame = CGRect(x: 30,
                                  y: firstNameField.bottom+10,
                                  width: scrollView.width-60,
                                  height: 52)
        emailField.frame = CGRect(x: 30,
                                  y: lastNameField.bottom+10,
                                  width: scrollView.width-60,
                                  height: 52)
        passwordField.frame = CGRect(x: 30,
                                     y: emailField.bottom+10,
                                     width: scrollView.width-60,
                                     height: 52)
        
        registerButton.frame = CGRect(x: 30,
                                   y: passwordField.bottom+30,
                                   width: scrollView.width-60,
                                   height: 52)
    }
    
    @objc private func registerButtonTapped(){
        
        emailField.resignFirstResponder() // schowanie keyboardu
        passwordField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        
        guard let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              let email = emailField.text,
              let password = passwordField.text,
              !email.isEmpty,
              !password.isEmpty,
              !firstName.isEmpty,
              !lastName.isEmpty,
              password.count >= 6 else {
            alertUserLoginError()
            return
        }
        
        
        // FIREBASE LOGIN LATER HERE
        
        
    }
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Oopsie", message: "Please fill all the gaps", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    @objc private func didTapRegister() {
        
        // we wanna push the registerViewController into the screen
        
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
}


extension RegisterViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField{
            passwordField.becomeFirstResponder()
            
        }
        else if textField == passwordField{
            registerButtonTapped()
        }
        return true
    }
}


