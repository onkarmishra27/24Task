import UIKit

class LoginSignupViewController: UIViewController {
    
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userNameOrEmail: UITextField!
    @IBOutlet weak var signUpUserName: UITextField!
    @IBOutlet weak var passWordHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var passwordEyeHeightContraints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        forgotPassword.isHidden = true
        loginButton.setTitle("Create Account", for: .normal)
        passwordEyeHeightContraints.constant = 65
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex  == 0{
            configureCreateAccountView()
        } else {
            configureLoginView()
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        if let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                self.navigationController?.pushViewController(homeViewController, animated: true)
            }
        guard let username = userNameOrEmail.text, let password = password.text else {
            // Handle error if any of the fields is empty
            return
        }
        
        let deviceToken = "" // get the device token here
        
        let parameters: [String: Any] = [
            "username": username,
            "password": password,
            "device_token": deviceToken,
            "profile_type_id": 2,
            "sys_id": 1,
            "device_type": 0,
            "loginMethod": "normal_login"
        ]
        
        let urlString = "https://u71j89oyyh.execute-api.us-east-2.amazonaws.com/dev/login"
        guard let url = URL(string: urlString) else {
            // Handle error if URL is invalid
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            // Handle error if unable to serialize parameters as JSON
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                // Handle error
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                // Handle response data
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print(jsonResponse)
                } catch {
                    // Handle error if unable to deserialize response data as JSON
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
    
    private func configureCreateAccountView() {
        userNameOrEmail.placeholder = "Email"
        signUpUserName.placeholder = "Username"
        forgotPassword.isHidden = true
        signUpUserName.isHidden = false
        forgotPassword.isHidden = true
        loginButton.setTitle("Create Account", for: .normal)
        passWordHeightConstrain.constant = 10
        passwordEyeHeightContraints.constant = 65
    }
    
    private func configureLoginView() {
        userNameOrEmail.placeholder = "Username or Email"
        signUpUserName.isHidden = true
        forgotPassword.isHidden = false
        loginButton.setTitle("Login", for: .normal)
        passWordHeightConstrain.constant = -50
        passwordEyeHeightContraints.constant = 5
    }
}
