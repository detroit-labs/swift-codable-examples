//
//  Rating.swift
//  Codable
//
//  Created by Nate Walczak on 9/27/18.
//  Copyright © 2018 Detroit Labs. All rights reserved.
//

import Foundation

enum Rating: String, CaseIterable, Codable {
    case oneStar = "*"
    case twoStars = "**"
    case threeStars = "***"
    case fourStars = "****"
    case fiveStars = "*****"
}
