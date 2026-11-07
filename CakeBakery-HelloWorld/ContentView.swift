//
//  ContentView.swift
//  CakeBakery-HelloWorld
//
//  Created by Reem on 07/11/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var cakeName = ""
    @State private var flour = 2.5
    @State private var sugar = 1.25
    @State private var eggs = 3
    @State private var showAddCakeSheet = false

    @State private var cakes: [[String: Any]] = [
        ["cakeName": "Chocolate cake", "flour": 2.5, "sugar": 1.25, "eggs": 3]
    ]

    var body: some View {
        NavigationStack {
            List(cakes.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text(cakes[index]["cakeName"] as? String ?? "").bold()
                    Text("Flour: \(cakes[index]["flour"] as? Double ?? 0, format: .number) cups")
                    Text("Sugar: \(cakes[index]["sugar"] as? Double ?? 0, format: .number) cups")
                    Text("Eggs: \(cakes[index]["eggs"] as? Int ?? 0)")
                }
            }
            .navigationTitle("My cakes")
            .toolbar {
                Button("Add cake") {
                    showAddCakeSheet = true
                }
            }
            .sheet(isPresented: $showAddCakeSheet) {
                Form {
                    Text("Add cake").font(.headline)
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

                    Button("Save") {
                        addCake()
                    }
                    Button("Cancel") {
                        showAddCakeSheet = false
                    }
                }
            }
        }
    }

    private func addCake() {
        let newCake: [String: Any] = [
            "cakeName": cakeName.trimmingCharacters(in: .whitespacesAndNewlines),
            "flour": flour,
            "sugar": sugar,
            "eggs": eggs
        ]

        cakes.append(newCake)
        showAddCakeSheet = false
    }
}

#Preview {
    ContentView()
}
