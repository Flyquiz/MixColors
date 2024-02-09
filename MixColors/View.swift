//
//  View.swift
//  MixColors
//
//  Created by Иван Захаров on 09.02.2024.
//

import UIKit

final class View: UIView {
    
    //MARK: First group
    private let firstColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Blue"
        return label
    }()
    
    private lazy var firstColorButton: UIButton = {
        let button = UIButton()
        let colorPicker = UIColorPickerViewController()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        
        return button
    }()
    
    //MARK: Second group
    private let secondColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Red"
        return label
    }()
    
    private lazy var secondColorButton: UIButton = {
        let button = UIButton()
        let colorPicker = UIColorPickerViewController()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        
        return button
    }()
    
    //MARK: Third group
    private let thirdColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Purple"
        return label
    }()
    
    private lazy var thirdColorButton: UIButton = {
        let button = UIButton()
        let colorPicker = UIColorPickerViewController()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        
        return button
    }()
    
    //MARK: Other labels
    private let plusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+"
        label.font = .systemFont(ofSize: 34)
        return label
    }()
    
    private let equalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "="
        label.font = .systemFont(ofSize: 34)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MixColors"
        label.font = .systemFont(ofSize: 34)
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: StackViews
    private lazy var firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addArrangedSubview(firstColorLabel)
        stackView.addArrangedSubview(firstColorButton)
        return stackView
    }()
    
    private lazy var secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addArrangedSubview(secondColorLabel)
        stackView.addArrangedSubview(secondColorButton)
        return stackView
    }()
    
    private lazy var thirdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addArrangedSubview(thirdColorLabel)
        stackView.addArrangedSubview(thirdColorButton)
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addArrangedSubview(firstStackView)
        stackView.addArrangedSubview(plusLabel)
        stackView.addArrangedSubview(secondStackView)
        stackView.addArrangedSubview(equalLabel)
        stackView.addArrangedSubview(thirdStackView)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .systemGray6

        [titleLabel, mainStackView].forEach { self.addSubview($0) }
        
        let buttonHeight: CGFloat = 75
        let buttonWidth: CGFloat = 75
                
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.height),
            
            mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
            firstColorButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            firstColorButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            
            secondColorButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            secondColorButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            
            thirdColorButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            thirdColorButton.widthAnchor.constraint(equalToConstant: buttonWidth),
        ])
    }
}
