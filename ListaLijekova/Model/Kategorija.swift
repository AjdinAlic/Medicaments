//
//  Kategorija.swift
//  ListaLijekova
//
//  Created by Ajdin on 19. 10. 2022..
//

import Foundation

class Kategorija :Identifiable, Decodable{
var id: Int
var mark: String
var name: String
var color : String

    init(id : Int = 0 ,mark: String = "" , name: String = "" ,color : String = "" ) {
        self.id = id
        self.mark = mark
        self.name = name
        self.color = color
    }
}

class apiKategorija {
    func getKategorije(completion:@escaping ([Kategorija]) -> ()) {
        guard let url = URL(string: "https://api.farmaceut.ba/test/categories") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let kategorije = try! JSONDecoder().decode([Kategorija].self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(kategorije)
            }
        }
        .resume()
    }
    
    func dodajKategoriju(lijekovi : [Lijek] , kategorije : [Kategorija])-> ([Lijek], [String]){
        var noviLijek = lijekovi
        var markList : [String] = []
        for (index , lijek) in lijekovi.enumerated() {
            for kategorija in kategorije {
                if lijek.categoryId == kategorija.id {
                    noviLijek[index].kategorija = kategorija
                    markList.append(kategorija.mark)
                }
            }
            
        }
        markList = markList.unique().sorted()
        return ( noviLijek , markList )
    }
    
    func addMark (mark  : String){
        
    }
}
extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: [Iterator.Element: Bool] = [:]
        return self.filter { seen.updateValue(true, forKey: $0) == nil }
    }
}
