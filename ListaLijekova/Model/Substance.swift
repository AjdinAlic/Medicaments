//
//  Substance.swift
//  ListaLijekova
//
//  Created by Ajdin on 21. 10. 2022..
//

import Foundation
class Substance :Codable{
var id: Int
var name: String
}
@MainActor
struct apiSubstance {
    var id : Int
    func getSubstancu(completion:@escaping ([Substance]) -> ())  {
        guard let url = URL(string: "https://api.farmaceut.ba/test/substances?drugid="+String(id)) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let substance = try! JSONDecoder().decode([Substance].self, from: data!)
        
            DispatchQueue.main.async {
                completion(substance)
            }
        }
        .resume()
    }
}
