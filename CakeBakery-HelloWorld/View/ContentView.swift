//
//  ContentView.swift
//  CakeBakery-HelloWorld
//
//  Created by Reem on 07/11/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CakeViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.cakes) { cake in
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
                    viewModel.showAddCakeSheet = true
                }
            }
        }
        .sheet(isPresented: $viewModel.showAddCakeSheet) {
            NavigationStack {
                Form {
                    TextField("Cake name", text: $viewModel.cakeName)

                    Section("Flour (cups)") {
                        TextField("Flour", value: $viewModel.flour, format: .number)
                            .keyboardType(.decimalPad)
                    }

                    Section("Sugar (cups)") {
                        TextField("Sugar", value: $viewModel.sugar, format: .number)
                            .keyboardType(.decimalPad)
                    }

                    Stepper("Eggs: \(viewModel.eggs)", value: $viewModel.eggs, in: 0...20)
                }
                .navigationTitle("Add cake")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            viewModel.showAddCakeSheet = false
                        }
                    }

                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            viewModel.addCake()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
