import UIKit
import SnapKit

class LoginSignupViewController: UIViewController {
    
    let signUpButton = UIButton()
    let loginButton = UIButton()
    let containerView = UIView()
    let loginView = UIView()
    let signupView = UIView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButtonInView = UIButton()

    
    var activeTab: ActiveTab = .signIn {
        didSet {
            if activeTab == .signIn {
                setActiveTabButton(button: signUpButton)
                containerView.addSubview(signupView)
                loginView.removeFromSuperview()
            } else {
                setActiveTabButton(button: loginButton)
                containerView.addSubview(loginView)
                signupView.removeFromSuperview()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the container view
        
        containerView.backgroundColor = UIColor(displayP3Red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        containerView.layer.cornerRadius = 20
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
        // Set up the sign in button
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(UIColor.black, for: .normal)
        signUpButton.backgroundColor = UIColor.white
        signUpButton.layer.cornerRadius = 15
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        containerView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().inset(2)
            make.width.equalTo(containerView.snp.width).dividedBy(2).offset(-10)
            make.leading.equalTo(containerView.snp.leading).offset(2)
        }
        
        // Set up the login button
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.black, for: .normal)
        loginButton.backgroundColor = UIColor.gray
        loginButton.layer.cornerRadius = 15
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        //login view:--------
        loginView.addSubview(usernameTextField)
        loginView.addSubview(passwordTextField)
        loginView.addSubview(loginButtonInView)
        
        usernameTextField.placeholder = "Username or Email"
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        
        loginButtonInView.setTitle("Login", for: .normal)
        loginButtonInView.setTitleColor(.white, for: .focused)
        loginButtonInView.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16) // set the font to bold
        loginButtonInView.backgroundColor = .systemBlue
        loginButtonInView.layer.cornerRadius = 10
        
       
        usernameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(40)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(40)
        }
        
        loginButtonInView.snp.makeConstraints{make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(80)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(40)
            make.width.equalToSuperview().offset(300)
        }

       

        
        containerView.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().inset(2)
            make.width.equalTo(containerView.snp.width).dividedBy(2).offset(-10)
            make.trailing.equalTo(containerView.snp.trailing).inset(2)
        }
        
        // Set up the sign up view
        view.addSubview(signupView)
        signupView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
        }
        
        // Set up the login view
        loginView.backgroundColor = UIColor.green
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
        }
        
        // Set initial tab as sign in
        activeTab = .signIn
    }
    
    func setActiveTabButton(button: UIButton) {
        signUpButton.backgroundColor = UIColor(displayP3Red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        loginButton.backgroundColor = UIColor(displayP3Red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        button.backgroundColor = UIColor.white
    }
    
    @objc func signUpButtonTapped()
 {
        activeTab = .signIn
    }
    
    @objc func loginButtonTapped() {
        activeTab = .login


    }
    
    enum ActiveTab {
        case signIn, login
    }
}
