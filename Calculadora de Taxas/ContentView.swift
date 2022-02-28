//
//  ContentView.swift
//  Calculadora de Taxas
//
//  Created by Yuri Cavalcante on 15/02/22.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var viewModel: CalculadoraViewModel
    @State private var cont: Double?
    @FocusState private var contIsFocused: Bool
    @State private var selectedParcelamento = CalculadoraViewModel.Parcelamento.one
    @State private var showPaymentConditions: Bool = false
    
    func calcular(){
        showPaymentConditions = true
        viewModel.calculate(valorTotal: cont ?? 0, parcelamento: selectedParcelamento)
        contIsFocused = false
    }
    
    var body: some View {
        NavigationView{
            VStack(spacing: 1.0, content: {
                Text("R$ "+String(format: "%.2f", viewModel.self.calculadora.valorTotal).replacingOccurrences(of: ".", with: ","))
                    .font(.title)
                    .multilineTextAlignment(.trailing)
                    .padding(10.0)
                if showPaymentConditions {
                    if selectedParcelamento == CalculadoraViewModel.Parcelamento.one {
                        Text("Você vai pagar R$ \(String(format: "%.2f", viewModel.getParcelamento(parcelas: Int(selectedParcelamento.rawValue) ?? 1))) à Vista.")
                    }else{
                        Text("Você vai pagar \(selectedParcelamento.rawValue) vezes de: R$ "+String(format: "%.2f", viewModel.getParcelamento(parcelas: Int(selectedParcelamento.rawValue) ?? 1)))
                    }
                }
                Spacer()
                
                Text("Selecione a quantidade de parcelas:")
                
                Picker("Parcelamento", selection: $selectedParcelamento) {
                    ForEach(viewModel.parcelamento(), id: \.self) { parcel in
                        Text(parcel.rawValue)
                            .tag(parcel)
                    }
                }.onTapGesture {
                    showPaymentConditions = false
                }
                HStack(content: {
                    Text("R$")
                    TextField("Digite o valor a ser calculado", value: $cont, format: .number)
                        .focused($contIsFocused)
                        .padding()
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .font(.headline)
                        .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
                })
                Button(action: calcular, label: {
                    Text("Calcular".uppercased())
                        .padding()
                        .background(Color.blue.cornerRadius(10))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.headline)
                })
                    .padding()
                
                Spacer()
                
            })
                .navigationTitle("Calculadora")
                .padding(10)
        }
        .navigationViewStyle(.stack)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let calculadora = CalculadoraViewModel()
        ZStack {
        ContentView(viewModel: calculadora)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
        }
    }
}
