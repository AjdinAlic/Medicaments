//
//  FilterView.swift
//  ListaLijekova
//
//  Created by Ajdin on 25. 10. 2022..
//

import SwiftUI

struct FilterView: View {
    var listaKategorija : [String]
    @Binding var searchKategorija : String
    var body: some View {
        
            HStack{
                ForEach(listaKategorija , id: \.self ) { kategorija in
                    Button{
                        if (searchKategorija != kategorija){
                            searchKategorija = kategorija
                        }
                        else{
                            searchKategorija = ""
                        }
                    }
                label:{
                    ZStack{
                        Rectangle()
                            .fill(searchKategorija != kategorija ?  Color(.blue) : Color(.gray))
                            .frame(width: 30, height: 40)
                            .cornerRadius(8)
                        Text(kategorija).foregroundColor(.white)
                    }
                }
                    
                    }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(listaKategorija: ["A","B","C"], searchKategorija: .constant(""))
    }
}
