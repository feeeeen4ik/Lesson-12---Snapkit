//
//  ViewController.swift
//  Lesson 12 - Snapkit
//
//  Created by Феликс on 03.11.2025.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        
        label.text = "Hello World 2"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Введите первое число"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        
        return textField
    }()
   
    lazy var textField2: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Введите второе число"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 20
        button.backgroundColor = .blue
        
        return button
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 20
        button.backgroundColor = .blue
        
        return button
    }()
    
    lazy var divideButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("/", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 20
        button.backgroundColor = .blue
        
        return button
    }()
    
    lazy var multiplyButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("*", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 20
        button.backgroundColor = .blue
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(textField2)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        view.addSubview(divideButton)
        view.addSubview(multiplyButton)
        

        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(label).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        textField2.snp.makeConstraints { make in
            make.top.equalTo(textField).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(textField2).offset(80)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            
        }
        plusButton.addTarget(self, action: #selector(plus), for: .touchUpInside)
            
        minusButton.snp.makeConstraints { make in
            make.top.equalTo(plusButton).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        minusButton.addTarget(self, action: #selector(minus), for: .touchUpInside)
        
        divideButton.snp.makeConstraints { make in
            make.top.equalTo(minusButton).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        divideButton.addTarget(self, action: #selector(divide), for: .touchUpInside)
        
        multiplyButton.snp.makeConstraints { make in
            make.top.equalTo(divideButton).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        multiplyButton.addTarget(self, action: #selector(multiply), for: .touchUpInside)
        
    }
    
    @objc func plus() {
        guard let firstNumber = Int(textField.text!) else { return }
        guard let secondNumber = Int(textField2.text!) else { return }
        let sum = firstNumber + secondNumber
        label.text = String(sum)
    }
    
    @objc func minus() {
        guard let firstNumber = Int(textField.text!) else { return }
        guard let secondNumber = Int(textField2.text!) else { return }
        let sum = firstNumber - secondNumber
        label.text = String(sum)
    }
    
    @objc func divide() {
        guard let firstNumber = Int(textField.text!) else { return }
        guard let secondNumber = Int(textField2.text!) else { return }
        if secondNumber == 0 {
            showAlert(title: "Ошибка!", message: "Делить на 0 нельзя!")
            return
        }
        
        let sum = firstNumber / secondNumber
        label.text = String(sum)
    }
    
    @objc func multiply() {
        guard let firstNumber = Int(textField.text!) else { return }
        guard let secondNumber = Int(textField2.text!) else { return }
        let sum = firstNumber * secondNumber
        label.text = String(sum)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}

