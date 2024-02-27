//
//  RegistrationViewController.swift
//  CoffeeShops
//
//  Created by Наталья on 07.02.2024.
//

import UIKit
import SnapKit

final class RegistrationViewController: UIViewController {
    var output: RegistrationViewOutput?
    
    private lazy var emailLabel = AuthorizationTitleLabel(title: "e-mail")
    private lazy var passwordLabel = AuthorizationTitleLabel(title: "Пароль")
    private lazy var repeatPasswordLabel = AuthorizationTitleLabel(title: "Повторите пароль")
    
    private lazy var emailTextField = InputField()
    private lazy var passwordTextField = InputField()
    private lazy var repeatPasswordTextField = InputField()
    
    private lazy var registrationButton = CustomButton(title: "Регистрация")
    
    private lazy var authorizationButton = ClickableLabel(title: "Войти")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "Регистрация"
        navigationItem.hidesBackButton = true
        
        addObservers()
        addSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addConstraints()
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func addSubviews() {
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(repeatPasswordLabel)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(registrationButton)
        view.addSubview(authorizationButton)
        
        registrationButton.addTarget(self, action: #selector(registrationAction), for: .touchUpInside)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        authorizationButton.delegate = self
    }
    
    private func addConstraints() {
        emailLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(18)
            $0.top.equalToSuperview().inset(190 + view.safeAreaInsets.top)
        }
        
        emailTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.top.equalTo(emailLabel.snp.bottom).offset(7.51)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(18)
            $0.top.equalTo(emailTextField.snp.bottom).offset(24)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.top.equalTo(passwordLabel.snp.bottom).offset(7.51)
        }
        
        repeatPasswordLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(18)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(24)
        }
        
        repeatPasswordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.top.equalTo(repeatPasswordLabel.snp.bottom).offset(7.51)
        }
        
        registrationButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.top.equalTo(repeatPasswordTextField.snp.bottom).offset(30)
        }
        
        authorizationButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.top.equalTo(registrationButton.snp.bottom).offset(24)
        }
    }
    
    @objc private func registrationAction() {
        output?.registration(login: emailTextField.text ?? "",
                             password: passwordTextField.text ?? "",
                             repeatPassword: repeatPasswordTextField.text ?? "")
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        view.frame.origin.y = -190
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}

extension RegistrationViewController: RegistrationViewInput {
    func showAlertError(message: String) {
        let alert = UIAlertController(title: "Ошибка!",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegistrationViewController: ClickableLabelDelegate {
    func tappedOnLabel() {
        output?.openAuthorizationModule()
    }
}
