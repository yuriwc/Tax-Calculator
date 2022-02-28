//
//  CalculadoraViewModel.swift
//  Calculadora de Taxas
//
//  Created by Yuri Cavalcante on 27/02/22.
//

import Foundation

class CalculadoraViewModel: ObservableObject {
    
    enum Parcelamento: String, Equatable, CaseIterable {
        case one    = "À Vista"
        case two    = "2"
        case three  = "3"
        case four   = "4"
        case five   = "5"
        case six    = "6"
        case seven  = "7"
        case eigth  = "8"
        case nine   = "9"
        case ten    = "10"
        case eleven = "11"
        case twelve = "12"
        
        var id: Parcelamento { self }
    }
    
    func parcelamento() -> [Parcelamento] {
        return Parcelamento.allCases
    }
    
    static func createCalculator() -> Calculadora{
        Calculadora(valorTotal: 0, taxa: 1.50)
    }
    
    @Published private var model: Calculadora = CalculadoraViewModel.createCalculator()
    
    var calculadora: Calculadora {
        return model.self
    }
    
    
    // MARK: - Intent(s)
    
    func calculate(valorTotal: Double, parcelamento: Parcelamento){
        var taxa = 2.45
        switch parcelamento {
        case .one:
            taxa = 2.45
        case .two:
            taxa = 3.71
        case .three:
            taxa = 4.17
        case .four:
            taxa = 4.63
        case .five:
            taxa = 5.09
        case .six:
            taxa = 5.54
        case .seven:
            taxa = 6.0
        case .eigth:
            taxa = 6.44
        case .nine:
            taxa = 6.89
        case .ten:
            taxa = 7.33
        case .eleven:
            taxa = 7.77
        case .twelve:
            taxa = 8.21
        }
        model.calcularTaxa(taxa: taxa, valorTotal: valorTotal)
    }
    
    func getParcelamento(parcelas: Int) -> Double{
        model.valorTotal/Double(parcelas)
    }
}
