//
//  AuthorizationViewController.swift
//  CoffeeShops
//
//  Created by Наталья on 09.02.2024.
//

import UIKit
import SnapKit

final class AuthorizationViewController: UIViewController {
    var output: AuthorizationViewOutput?
    
    private lazy var emailLabel = AuthorizationTitleLabel(title: "e-mail")
    private lazy var passwordLabel = AuthorizationTitleLabel(title: "Пароль")
    
    private lazy var emailTextField = InputField()
    private lazy var passwordTextField = InputField()
    
    private lazy var authorizationButton = CustomButton(title: "Войти")
    
    private lazy var registrationButton = ClickableLabel(title: "Зарегистрироваться")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Вход"
        
        addObservers()
        createNavigationBar()
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
        view.addSubview(authorizationButton)
        view.addSubview(registrationButton)
        
        authorizationButton.addTarget(self, action: #selector(authorizationAction), for: .touchUpInside)
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        registrationButton.delegate = self
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
        
        authorizationButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
        }
        
        registrationButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(18)
            $0.top.equalTo(authorizationButton.snp.bottom).offset(24)
        }
    }
    
    @objc private func authorizationAction() {
        output?.authorization(login: emailTextField.text ?? "",
                                 password: passwordTextField.text ?? "")
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        view.frame.origin.y = -190
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}

extension AuthorizationViewController: AuthorizationViewInput {
    func showAlertError(message: String) {
        let alert = UIAlertController(title: "Ошибка!",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

extension AuthorizationViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension AuthorizationViewController: ClickableLabelDelegate {
    func tappedOnLabel() {
        output?.openRegistrationModule()
    }
}
