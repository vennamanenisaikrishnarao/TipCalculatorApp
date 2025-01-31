//
//  ContentView.swift
//  TipCalculatorApp
//
//  Created by Vennamaneni, Sai Krishna on 1/31/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billAmount: Double = 0.0
    @State private var tipPercentage: Double = 0.0
    @State private var numberOfPeople: Double = 1.0
    @State private var showResults: Bool = false
    @State private var selectedCurrency: Int = 0
    
    private let currency = ["USD", "EUR", "GBP", "INR", "JPY", "AUD"]
    
    private var tipAmount: Double {
        billAmount * tipPercentage / 100
    }
    
    private var totalAmount: Double {
        billAmount + tipAmount
    }
    
    private var amountPerPerson: Double {
        return totalAmount / numberOfPeople
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Spacer().frame(height: 20)
            
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
    
            Button(action: {
                selectedCurrency = (selectedCurrency + 1) % currency.count
            }) {
                Text(currency[selectedCurrency])
                    .font(.system(size: 20, weight: .bold))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(25)
                    .background(Color.black)
                    .clipShape(Circle())
                    .shadow(color: .gray, radius: 5, x: 0, y: 2)
            }
            
            VStack(alignment: .center, spacing: 15) {
                
                VStack(spacing: 5){
                    
                    Text("Bill Amount")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .bold))
                        
                    Text("\(billAmount, format:  .currency(code: currency[selectedCurrency]))")
                        .foregroundColor(.purple)
                        .font(.system(size: 25, weight: .bold))
                }
                
                Slider(value: $billAmount, in: 0...500, step: 1)
                    .accentColor(.purple)
                
            }
            .padding(.horizontal, 25)
            
            VStack(alignment: .center, spacing: 15) {
                
                VStack(spacing: 5){
                    
                    Text("Tip Percentage")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .bold))
                    
                    Text("\(Int(tipPercentage))%")
                        .foregroundColor(.green)
                        .font(.system(size: 25, weight: .bold))
                }
                
                Slider(value: $tipPercentage, in: 0...30, step: 1)
                    .accentColor(.green)
            }
            .padding(.horizontal, 25)
            
            VStack(alignment: .center, spacing: 15) {
                
                VStack(spacing: 5){
                    
                    Text("Number of People")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .bold))
                    
                    Text("\(Int(numberOfPeople))")
                        .foregroundColor(.orange)
                        .font(.system(size: 25, weight: .bold))
                }
                
                Slider(value: $numberOfPeople, in: 1...20, step: 1)
                    .accentColor(.orange)
            }
            .padding(.horizontal, 25)
            
            Button(action: { showResults.toggle() }) {
                Text(showResults ? "Hide Results" : "Calculate")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(showResults ? Color.red : Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }
            .padding(.top, 10)
            
            if showResults {
                VStack(spacing: 10) {

                    Text("Tip Amount: \(tipAmount, format:  .currency(code: currency[selectedCurrency]))")
                    
                    Text("Total Amount: \(totalAmount, format:  .currency(code: currency[selectedCurrency]))")
                    
                    Text("Amount Per Person: \(amountPerPerson, format:  .currency(code: currency[selectedCurrency]))")
                    
                }
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.black)
                .padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.5), lineWidth: 1))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                .padding(.horizontal, 20)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
