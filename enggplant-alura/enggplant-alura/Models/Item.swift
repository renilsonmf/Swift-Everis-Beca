//
//  Item.swift
//  enggplant-alura
//
//  Created by Renilson Moreira Ferreira on 12/03/21.
//  Copyright © 2021 Renilson Moreira Ferreira. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding{
 
    
    // Atributos
    
    let nome: String
    let calorias: Double
    
    // Init
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
    // Salva as informaões ao fechar o app
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        calorias = aDecoder.decodeDouble(forKey: "calorias")

    }

}
