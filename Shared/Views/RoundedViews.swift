//
//  RoundedViews.swift
//  SellMyArt
//
//  Created by Hrushikesh Nimbalkar on 15/10/24.
//

import Foundation
import UIKit

class RoundedCorner: UIButton {
    override  func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}

class RoundedShadowView: UIView {
    override  func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowColor = AppColours.Blue.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
    }
}

class RoundedImageImageView: UIImageView{
    override  func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}
