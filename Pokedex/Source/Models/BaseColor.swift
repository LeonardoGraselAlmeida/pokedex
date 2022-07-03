//
//  BaseColor.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class BaseColor {
    static let shared = BaseColor()
    
    private let colors: Dictionary<String, UIColor> = [
        "rock": UIColor(red: 0.714, green: 0.62, blue: 0.192, alpha: 1),
        "normal": UIColor(red: 0.667, green: 0.651, blue: 0.498, alpha: 1),
        "ghost": UIColor(red: 0.439, green: 0.333, blue: 0.608, alpha: 1),
        "fighting": UIColor(red: 0.757, green: 0.133, blue: 0.224, alpha: 1),
        "steel": UIColor(red: 0.718, green: 0.725, blue: 0.816, alpha: 1),
        "flying": UIColor(red: 0.659, green: 0.569, blue: 0.925, alpha: 1),
        "water": UIColor(red: 0.392, green: 0.576, blue: 0.922, alpha: 1),
        "poison": UIColor(red: 0.643, green: 0.243, blue: 0.62, alpha: 1),
        "grass": UIColor(red: 0.455, green: 0.796, blue: 0.282, alpha: 1),
        "ground": UIColor(red: 0.871, green: 0.757, blue: 0.42, alpha: 1),
        "psychic": UIColor(red: 0.984, green: 0.333, blue: 0.518, alpha: 1),
        "bug": UIColor(red: 0.655, green: 0.718, blue: 0.137, alpha: 1),
        "ice": UIColor(red: 0.604, green: 0.839, blue: 0.875, alpha: 1),
        "fire": UIColor(red: 0.961, green: 0.49, blue: 0.192, alpha: 1),
        "dark": UIColor(red: 0.459, green: 0.341, blue: 0.298, alpha: 1),
        "electric": UIColor(red: 0.976, green: 0.812, blue: 0.188, alpha: 1),
        "fairy": UIColor(red: 0.902, green: 0.62, blue: 0.675, alpha: 1),
        "dragon": UIColor(red: 0.439, green: 0.216, blue: 1, alpha: 1)
    ]
    
    func getColor(type: String) -> UIColor {
        return colors[type] ?? UIColor()
    }
}
