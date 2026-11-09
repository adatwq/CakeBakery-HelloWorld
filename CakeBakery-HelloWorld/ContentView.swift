//
//  ContentView.swift
//  CakeBakery-HelloWorld
//
//  Created by Reem on 07/11/2026.
//

import SwiftUI

struct Cake: Identifiable {
    let id = UUID()
    var cakeName: String
    var flour: Double
    var sugar: Double
    var eggs: Int
}

struct ContentView: View {
    @State private var cakeName = ""
    @State private var flour = 2.5
    @State private var sugar = 1.25
    @State private var eggs = 3
    @State private var showAddCakeSheet = false
    
    @State private var cakes: [Cake] = [
        Cake(cakeName: "Chocolate cake", flour: 2.5, sugar: 1.25, eggs: 3)
    ]
    
    var body: some View {
        NavigationStack {
            List(cakes) { cake in
                VStack(alignment: .leading) {
                    Text(cake.cakeName).bold()
                    Text("Flour: \(cake.flour, format: .number) cups")
                    Text("Sugar: \(cake.sugar, format: .number) cups")
                    Text("Eggs: \(cake.eggs)")
                }
            }
            .navigationTitle("My cakes")
            .toolbar {
                Button("Add cake") {
                    showAddCakeSheet = true
                }
            }
            .sheet(isPresented: $showAddCakeSheet) {
                NavigationStack {
                    Form {
                        TextField("Cake name", text: $cakeName)
                        
                        Section("Flour (cups)") {
                            TextField("Flour", value: $flour, format: .number)
                                .keyboardType(.decimalPad)
                        }
                        Section("Sugar (cups)") {
                            TextField("Sugar", value: $sugar, format: .number)
                                .keyboardType(.decimalPad)
                        }
                        Stepper("Eggs: \(eggs)", value: $eggs, in: 0...20)
                        
                    }
                    .navigationTitle("Add cake")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showAddCakeSheet = false
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                addCake()
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    
    
    private func addCake() {
        let newCake = Cake(
            cakeName: cakeName.trimmingCharacters(in: .whitespacesAndNewlines),
            flour: flour,
            sugar: sugar,
            eggs: eggs
        )
        
        cakes.append(newCake)
        showAddCakeSheet = false
    }
}

#Preview {
    ContentView()
}
