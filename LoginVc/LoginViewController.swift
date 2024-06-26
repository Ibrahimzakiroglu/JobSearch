//
//  LoginViewController.swift
//  Jobiz
//
//  Created by Developer on 24.06.24.
//
import UIKit
import SnapKit
//import FirebaseAuth
//import GoogleSignIn

class LoginViewController: UIViewController {
    
    //    private let viewModel = LoginViewModel()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "E-mail"
        textField.borderStyle = .roundedRect
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(systemName: "envelope"))
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(systemName: "lock"))
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.isEnabled = false
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let googleSignInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "google_icon"), for: .normal)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        //     }
    }
    
    private func setupUI() {
        let titleLabel = UILabel()
        titleLabel.text = "Jôbizz"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textColor = .systemBlue
        
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome Back 👋"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Let's log in. Apply to jobs!"
        subtitleLabel.font = UIFont.systemFont(ofSize: 16)
        subtitleLabel.textColor = .systemGray
        
        let socialStackView = UIStackView(arrangedSubviews: [googleSignInButton])
        socialStackView.axis = .horizontal
        socialStackView.spacing = 16
        socialStackView.distribution = .fillEqually
        
        view.addSubview(titleLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(stackView)
        view.addSubview(socialStackView)
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(forgotPasswordButton)
        stackView.addArrangedSubview(registerButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.centerX.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        socialStackView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.height.equalTo(44)
        }
        
        //        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        //        forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
        //        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        //        googleSignInButton.addTarget(self, action: #selector(didTapGoogleSignInButton), for: .touchUpInside)
        //    }
        //    
        //    private func setupBindings() {
        //        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        //        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        //    }
        
        //    @objc private func textFieldDidChange(_ textField: UITextField) {
        //        viewModel.email = emailTextField.text ?? ""
        //        viewModel.password = passwordTextField.text ?? ""
        //        loginButton.isEnabled = viewModel.isLoginButtonEnabled
        //    }
        //
        //    @objc private func didTapLoginButton() {
        //        viewModel.login { result in
        //            switch result {
        //            case .success(let user):
        //                print("User logged in: \(user.email ?? "")")
        //                // Navigate to the next screen
        //            case .failure(let error):
        //                print("Failed to log in: \(error.localizedDescription)")
        //            }
        //        }
        //    }
        //
        //    @objc private func didTapGoogleSignInButton() {
        //        viewModel.googleLogin(presentingViewController: self) { result in
        //            switch result {
        //            case .success(let user):
        //                print("User logged in with Google: \(user.email ?? "")")
        //                // Navigate to the next screen
        //            case .failure(let error):
        //                print("Failed to log in with Google: \(error.localizedDescription)")
        //            }
        //        }
        //    }
        //
        //    @objc private func didTapForgotPasswordButton() {
        //        // Navigate to forgot password screen
        //    }
        //
        //    @objc private func didTapRegisterButton() {
        //        // Navigate to registration screen
        //    }
        //}
    }
}
