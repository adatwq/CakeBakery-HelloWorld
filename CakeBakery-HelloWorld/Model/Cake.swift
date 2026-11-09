//
//  Untitled.swift
//  CakeBakery-HelloWorld
//
//  Created by Reem on 07/11/2026.
//

import Foundation

struct Cake: Identifiable {
    let id = UUID()
    var cakeName: String
    var flour: Double
    var sugar: Double
    var eggs: Int
}
