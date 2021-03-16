//
//  ItemDao.swift
//  enggplant-alura
//
//  Created by Renilson Moreira Ferreira on 16/03/21.
//  Copyright © 2021 Renilson Moreira Ferreira. All rights reserved.
//

import Foundation
// Salvando os dados ao fechar o app

class ItemDao{
    
    func save(_ itens: [Item]){
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens,
                                                         requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else{return}
            try dados.write(to: caminho)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Item]{
        do{
            guard let diretorio = recuperaDiretorio() else {return[]}
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos =  try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
            return itensSalvos
            
        }catch{
            print(error.localizedDescription)
            return []
        }
        
    }
    
    // Recuperando os dados antes de fechar o app
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{return nil}
        let caminho = diretorio.appendingPathComponent("itens")
        return caminho
    }
    
}
