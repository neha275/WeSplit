//
//  ContentView.swift
//  WeSplit
//
//  Created by Neha Gupta on 27/04/20.
//  Copyright © 2020 Neha Gupta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,0]
    @State private var grandTotal: Double  = 0
    var totalPerPerson:Double{
        let peopleCount = Double (numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount/100 * tipSelection
        //print("tipValue \(tipValue)")
        DispatchQueue.main.async {
            self.grandTotal = orderAmount + tipValue
        }
        // grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Amount",text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number pf People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                    Section(header: Text("How much tip do you want to leave?")) {
                         Picker("Tip Percentage", selection: $tipPercentage) {
                            ForEach (0 ..< tipPercentages.count){
                                Text("\(self.tipPercentages[$0])%")
                            }
                         }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                Section (header : Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section (header : Text("Total amount for check")) {
                    Text("$\(grandTotal,specifier: "%.2f")")
                }
            }
            .navigationBarTitle("We Split")
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
