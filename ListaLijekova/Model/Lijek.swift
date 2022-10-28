//
//  Lijek.swift
//  ListaLijekova
//
//  Created by Ajdin on 19. 10. 2022..
//

import Foundation
import SwiftUI

struct Lijek : Identifiable , Decodable {
    var id : Int
    var name : String
    var atc  : String?
    var shortDescription : String?
    var description: String?
    var categoryId: Int?
    var activeSubstanceValue: Int?
    var activeSubstanceMeasurementUnit: String?
    var activeSubstanceSelectedQuantity: Int?
    var activeSubstanceQuantityMeasurementUnit: String?
    var minimumDailyDose: Int?
    var maximumDailyDose: Int?
    var showOnCalculator: Bool?
    var forbiddenInPregnancy: Bool?
    var kategorija : Kategorija?
    
    
    init(id: Int = 0, name: String = "", atc: String = "", shortDescription: String = "", description: String = "", categoryId: Int = 0, activeSupstanceValue: Int = 0, activeSubstanceMeasurementUnit: String = "", activeSubstanceSelectedQuantity: Int = 0, activeSubstanceQuantityMeasurementUnit: String = "", minimumDailyDose: Int = 0, maximumDailyDose: Int = 0, showOnCalculator: Bool = false, forbiddenInPregnancy: Bool = false ) {
        self.id = id
        self.name = name
        self.atc = atc
        self.shortDescription = shortDescription
        self.description = description
        self.categoryId = categoryId
        self.activeSubstanceValue = activeSupstanceValue
        self.activeSubstanceMeasurementUnit = activeSubstanceMeasurementUnit
        self.activeSubstanceSelectedQuantity = activeSubstanceSelectedQuantity
        self.activeSubstanceQuantityMeasurementUnit = activeSubstanceQuantityMeasurementUnit
        self.minimumDailyDose = minimumDailyDose
        self.maximumDailyDose = maximumDailyDose
        self.showOnCalculator = showOnCalculator
        self.forbiddenInPregnancy = forbiddenInPregnancy
      }


}

class apiLijek {
    func getLijekovi(completion:@escaping ([Lijek]) -> ()) {
        guard let url = URL(string: "https://api.farmaceut.ba/test/medicaments") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let lijekovi = try! JSONDecoder().decode([Lijek].self, from: data!)
            
            DispatchQueue.main.async {
                completion(lijekovi)
            }
        }
        .resume()
    }
}
