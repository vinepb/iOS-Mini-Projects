//
//  ContentView.swift
//  SplitTheBill
//
//  Created by Vinicius Bernardo on 23/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var totalCost = ""
    @State private var people = 4
    @State private var tipIndex = 2
    let tipPercentages = [0, 5, 10, 15]
    
    func calculateTotal() -> Double {
        let tip = Double(tipPercentages[tipIndex])
        let orderTotal = Double(totalCost) ?? 0
        let finalAmount = ((orderTotal / 100 * tip) + orderTotal)
        
        return finalAmount / Double(people)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Enter an amount")) {
                    TextField("Amount", text: $totalCost).keyboardType(.decimalPad)
                }
                Section(header: Text("Select the tip amount")) {

                    Picker("Tip percentage", selection: $tipIndex) {
                        ForEach(0 ..< 4) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("How many people?")) {
                    Picker("Number of people", selection: $people) {
                        ForEach(0 ..< 25) {
                            Text("\($0) people")
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                Section(header: Text("total per person")) {
                    Text("R$ \(calculateTotal(), specifier: "%.2f")")
                }
            }.navigationTitle("Split the Bill")
        }
    }
}

#Preview {
    ContentView()
}
