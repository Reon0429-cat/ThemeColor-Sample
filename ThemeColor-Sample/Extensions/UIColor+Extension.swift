//
//  UIColor+Extension.swift
//  ThemeColor-Sample
//
//  Created by 大西玲音 on 2021/06/28.
//

import UIKit

extension UIColor {
    
    // hex(16進数) -> rgb
    convenience init(hex: String) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    // UIColor -> それぞれのrgb値
    var redValue: CGFloat {
        return self.cgColor.components![0]
    }
    
    var greenValue: CGFloat {
        return self.cgColor.components![1]
    }
    
    var blueValue: CGFloat {
        return self.cgColor.components![2]
    }
    
}
