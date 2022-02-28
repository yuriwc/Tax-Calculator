//
//  Calculadora_de_TaxasApp.swift
//  Calculadora de Taxas
//
//  Created by Yuri Cavalcante on 15/02/22.
//

import SwiftUI

@main
struct Calculadora_de_TaxasApp: App {
    let calculadora = CalculadoraViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: calculadora)
        }
    }
}
