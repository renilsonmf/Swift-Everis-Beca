//
//  Refeicao.swift
//  enggplant-alura
//
//  Created by Renilson Moreira Ferreira on 12/03/21.
//  Copyright © 2021 Renilson Moreira Ferreira. All rights reserved.
//

import UIKit

class Refeicao: NSObject, NSCoding {
   
    //Atributos
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    //Metodo Construtor
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    //MARK: - NSCoding Aqui serve pra guardar as informaçoes caso o app seja fechado
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(felicidade, forKey: "felicidade")
        aCoder.encode(itens, forKey: "itens")

    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade")
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
    }
    
    
    
    // Metodos
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens{
            total += item.calorias
        }
        return total
        
    }
    func detalhes() -> String{
        
        var mensagem = "Felicidade \(felicidade)"
        
        for item in itens{
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return mensagem
        
    }
}
