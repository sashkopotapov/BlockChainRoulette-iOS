//
//  NetworkManager.swift
//  RouletteWheelGame
//
//  Created by Mac on 15.01.2020.
//  Copyright © 2020 OSX. All rights reserved.
//

import Foundation
import UIKit

public enum MiddleRadiusSize : CGFloat{
    case small = 0.30, medium = 0.33, large = 0.36
}

//MARK: - Ball/NumberView Animation
enum AnimationObject {
    case Number
    case BackImage
}

//MARK: - Animation Type
enum AnimationTypes: String {
    
    case zRotation = "transform.rotation.z"
    case animation = "rotationAnimation"
}
