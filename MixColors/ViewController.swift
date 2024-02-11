//
//  ViewController.swift
//  MixColors
//
//  Created by Иван Захаров on 09.02.2024.
//

import UIKit

final class ViewController: UIViewController, ViewDelegate {
    
    private let externalView = View()
    
    lazy public var selectedColorOne = UIColor(.blue) {
        didSet {
            externalView.setColor(for: 1, color: selectedColorOne)
        }
    }
    
    lazy public var selectedColorTwo = UIColor(.red) {
        didSet {
            externalView.setColor(for: 2, color: selectedColorTwo)
        }
    }
    
    lazy public var blendedColor = UIColor() {
        didSet {
            externalView.setColor(for: 3, color: blendedColor)
        }
    }
    
    private lazy var colorPickerOne: UIColorPickerViewController = {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        return colorPicker
    }()
    
    private lazy var colorPickerTwo: UIColorPickerViewController = {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        return colorPicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        externalView.delegate = self
        view = externalView
    }
    
    internal func firstButtonAction() {
        present(colorPickerOne, animated: true)
    }
    
    internal func secondButtonAction() {
        present(colorPickerTwo, animated: true)
    }
    
    private func blendColors(color1: UIColor, color2: UIColor) {
        var red1: CGFloat = 0
        var green1: CGFloat = 0
        var blue1: CGFloat = 0
        var alpha1: CGFloat = 0
        color1.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
        //        print("Color1 red:\(red1), green:\(green1), blue:\(blue1), alpha:\(alpha1)")
        
        var red2: CGFloat = 0
        var green2: CGFloat = 0
        var blue2: CGFloat = 0
        var alpha2: CGFloat = 0
        color2.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        //        print("Color2 red:\(red2), green:\(green2), blue:\(blue2), alpha:\(alpha2)")
        
        let blendedRed = (red1 + red2) / 2
        let blendedGreen = (green1 + green2) / 2
        let blendedBlue = (blue1 + blue2) / 2
        let blendedAlpha = (alpha1 + alpha2) / 2
        
        let blendedColor = UIColor(red: blendedRed, green: blendedGreen, blue: blendedBlue, alpha: blendedAlpha)
        //        print("Mixed red:\(blendedRed), green:\(blendedGreen), blue:\(blendedBlue), alpha:\(blendedAlpha) \n")
        print(blendedColor.description)
        self.blendedColor = blendedColor
        externalView.setLabel(for: 3, name: getColorLabel(color: blendedColor))
    }
    
    private func getColorLabel(color: UIColor) -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: nil)
        print(red)
        
        let roundedRed = round(red * 100) / 100
        let roundedGreen = round(green * 100) / 100
        let roundedBlue = round(blue * 100) / 100
        print("red\(roundedRed)")
        print("green\(roundedGreen)")
        print("blue\(roundedBlue)")

        
        switch (roundedRed, roundedGreen, roundedBlue) {
        case (0.9...1.1, 0.9...1.1, 0.9...1.1):
            return "Белый"
            
        case (0...0.1, 0...0.1, 0...0.1):
            return "Черный"
            
        case (0.85...1.1, 0...0.35, 0...0.35):
            return "Красный"
            
        case (0...0.4, 0.85...1.1, 0...0.4):
            return "Зеленый"
            
        case (0...0.35, 0...0.55, 0.85...1.1):
            return "Синий"
            
        case (0.9...1.1, 0.9...1.1, 0...0.3):
            return "Желтый"
            
        case (0.3...0.7, 0...0.35, 0.7...1):
            return "Фиолетовый"
            
        case (0...0.3, 0.7...1.1, 0.8...1.1):
            return "Бирюзовый"
            
        case (0.9...1.1, 0.5...0.75, 0...0.3):
            return "Оранжевый"
            
        case (0.3...0.6, 0.1...0.3, 0...0.2):
            return "Коричневый"
            
        case (0.6...0.65, 0.6...0.65, 0.6...0.65):
            return "Серый"
            
        default:
            return "Неопределенный цвет"
        }
    }
}


extension ViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        switch viewController {
        case colorPickerOne:
            let selectedColor = viewController.selectedColor
            selectedColorOne = selectedColor
            externalView.setLabel(for: 1, name: getColorLabel(color: selectedColor))
        case colorPickerTwo:
            let selectedColor = viewController.selectedColor
            selectedColorTwo = viewController.selectedColor
            externalView.setLabel(for: 2, name: getColorLabel(color: selectedColor))
        default: break
        }
        
        do {
            blendColors(color1: selectedColorOne, color2: selectedColorTwo)
        }
    }
}

