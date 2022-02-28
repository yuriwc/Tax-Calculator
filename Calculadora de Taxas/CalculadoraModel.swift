//
//  CalculadoraModel.swift
//  Calculadora de Taxas
//
//  Created by Yuri Cavalcante on 27/02/22.
//

import SwiftUI

struct Calculadora {
    
    var taxa: Double
    var valorTotal: Double
    
    
    mutating func calcularTaxa(taxa: Double, valorTotal: Double) {
        self.valorTotal =  valorTotal + (valorTotal * (taxa/100))
    }
    
    init(valorTotal: Double, taxa: Double){
        self.taxa = taxa
        self.valorTotal = valorTotal
    }
}
