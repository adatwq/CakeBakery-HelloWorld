//
//  Untitled.swift
//  CakeBakery-HelloWorld
//
//  Created by Reem on 07/11/2026.
//

import Foundation
import Combine

final class CakeViewModel: ObservableObject {
    @Published var cakeName = ""
    @Published var flour = 2.5
    @Published var sugar = 1.25
    @Published var eggs = 3
    @Published var showAddCakeSheet = false

    @Published var cakes: [Cake] = [
        Cake(
            cakeName: "Chocolate cake",
            flour: 2.5,
            sugar: 1.25,
            eggs: 3
        )
    ]

    func addCake() {
        let newCake = Cake(
            cakeName: cakeName,
            flour: flour,
            sugar: sugar,
            eggs: eggs
        )

        cakes.append(newCake)
        showAddCakeSheet = false
    }
}
