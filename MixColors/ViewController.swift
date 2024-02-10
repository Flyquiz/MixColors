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
            externalView.setTermColor(for: 1, color: selectedColorOne)
        }
    }
    
    lazy public var selectedColorTwo = UIColor(.red) {
        didSet {
            externalView.setTermColor(for: 2, color: selectedColorTwo)
        }
    }
    
    lazy public var blendedColor = UIColor() {
        didSet {
            externalView.setSumColor(color: blendedColor)
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
        print("Color1 red:\(red1), green:\(green1), blue:\(blue1), alpha:\(alpha1)")
        
        var red2: CGFloat = 0
        var green2: CGFloat = 0
        var blue2: CGFloat = 0
        var alpha2: CGFloat = 0
        color2.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        print("Color2 red:\(red2), green:\(green2), blue:\(blue2), alpha:\(alpha2)")
        
        let blendedRed = (red1 + red2) / 2
        let blendedGreen = (green1 + green2) / 2
        let blendedBlue = (blue1 + blue2) / 2
        let blendedAlpha = (alpha1 + alpha2) / 2
        
        let blendedColor = UIColor(red: blendedRed, green: blendedGreen, blue: blendedBlue, alpha: blendedAlpha)
        print("Mixed red:\(blendedRed), green:\(blendedGreen), blue:\(blendedBlue), alpha:\(blendedAlpha) \n")
        self.blendedColor = blendedColor
    }
}


extension ViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        switch viewController {
        case colorPickerOne:
            selectedColorOne = viewController.selectedColor
        case colorPickerTwo:
            selectedColorTwo = viewController.selectedColor
        default: break
        }
        
        do {
            blendColors(color1: selectedColorOne, color2: selectedColorTwo)
        }
    }
}

