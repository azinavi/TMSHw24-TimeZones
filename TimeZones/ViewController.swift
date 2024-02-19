//
//  ViewController.swift
//  TimeZones
//
//  Created by azinavi on 19/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var cityArray = ["Москва", "Нью-Йорк", "Лондон", "Париж", "Токио"]
    var selectedCountryIndex: Int?

    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        
    }
    
    private func setupTextField() {
        textField.placeholder = "Введите город"
        textField.textAlignment = .left
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.inputView = pickerView
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonPressed))
        toolBar.setItems([done], animated: true)
        textField.inputAccessoryView = toolBar
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 200),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    @objc func doneButtonPressed() {
        textField.resignFirstResponder()
    }
    
    func showOnDisplay() {
        let dateFormatter = DateFormatter()
        let currentDate = Date()
        dateFormatter.dateFormat = "HH:mm:ss"
        if let selectedCountryIndex = selectedCountryIndex {
            let city = cityArray[selectedCountryIndex]
            nameLabel.text = "\(city)"
            
            switch cityArray[selectedCountryIndex] {
            case "Москва" :
                let targetTimeZone = TimeZone(identifier: "Europe/Moscow")!
                dateFormatter.timeZone = targetTimeZone
                let formattedTime = dateFormatter.string(from: currentDate)
                print("Текущее время: \(formattedTime)")
                timeLabel.text = "\(formattedTime)"
            case "Нью-Йорк":
                let targetTimeZone = TimeZone(identifier: "America/New_York")!
                dateFormatter.timeZone = targetTimeZone
                let formattedTime = dateFormatter.string(from: currentDate)
                print("Текущее время: \(formattedTime)")
                timeLabel.text = "\(formattedTime)"
            case "Лондон" :
                let targetTimeZone = TimeZone(identifier: "Europe/London")!
                dateFormatter.timeZone = targetTimeZone
                let formattedTime = dateFormatter.string(from: currentDate)
                print("Текущее время: \(formattedTime)")
                timeLabel.text = "\(formattedTime)"
            case "Париж" :
                let targetTimeZone = TimeZone(identifier: "Europe/Paris")!
                dateFormatter.timeZone = targetTimeZone
                let formattedTime = dateFormatter.string(from: currentDate)
                print("Текущее время: \(formattedTime)")
                timeLabel.text = "\(formattedTime)"
            case "Токио" :
                let targetTimeZone = TimeZone(identifier: "Asia/Tokyo")!
                dateFormatter.timeZone = targetTimeZone
                let formattedTime = dateFormatter.string(from: currentDate)
                print("Текущее время: \(formattedTime)")
                timeLabel.text = "\(formattedTime)"
            default:
                print("This city is not find")
            }
        }
        
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
        
        view.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            timeLabel.heightAnchor.constraint(equalToConstant: 30),
            timeLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
    }
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountryIndex = row
        showOnDisplay()
    }
    
}


