//
//  LoginViewViewController.swift
//  24Task-ios
//
//  Created by Active Mac Lap 01 on 23/04/23.
//

//import UIKit
//
//class LoginViewController: UIViewController {
//    let usernameTextField = UITextField()
//    let passwordTextField = UITextField()
//    let loginButton = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // ...
//
//        // Set up the login view
//        loginView.backgroundColor = UIColor.green
//        view.addSubview(loginView)
//        loginView.snp.makeConstraints { make in
//            make.top.equalTo(containerView.snp.bottom).offset(20)
//            make.leading.trailing.equalToSuperview()
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
//        }
//
//        // Set up the username text field
//        usernameTextField.placeholder = "Username"
//        usernameTextField.textColor = .black
//        usernameTextField.borderStyle = .roundedRect
//        loginView.addSubview(usernameTextField)
//        usernameTextField.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().offset(-40)
//            make.width.equalToSuperview().multipliedBy(0.8)
//        }
//
//        // Set up the password text field
//        passwordTextField.placeholder = "Password"
//        passwordTextField.textColor = .black
//        passwordTextField.isSecureTextEntry = true
//        passwordTextField.borderStyle = .roundedRect
//        loginView.addSubview(passwordTextField)
//        passwordTextField.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
//            make.width.equalTo(usernameTextField.snp.width)
//        }
//
//        // Set up the login button
//        loginButton.setTitle("Login", for: .normal)
//        loginButton.setTitleColor(UIColor.black, for: .normal)
//        loginButton.backgroundColor = UIColor.gray
//        loginButton.layer.cornerRadius = 15
//        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
//        loginView.addSubview(loginButton)
//        loginButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
//            make.width.equalTo(usernameTextField.snp.width)
//        }
//    }
//    @objc func loginButtonTapped() {
//        let username = usernameTextField.text ?? ""
//        let password = passwordTextField.text ?? ""
//        // TODO: Implement the login logic here
//    }
//
//}
