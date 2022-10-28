//
//  ListaLijekovaView.swift
//  ListaLijekova
//
//  Created by Ajdin on 19. 10. 2022..
//

import SwiftUI

struct ListaLijekovaView: View {
    @State var listaLijekova : [Lijek] = []
    @State var kategorija : [String] = []
    @State var searchText = ""
    @State var searchKategorija = ""
    var body: some View {
            NavigationView{
                TabView{
                    VStack{
                        FilterView(listaKategorija: kategorija ,searchKategorija: $searchKategorija)
                        List(searchLijek(Lijekovi: listaLijekova, search: searchText , kategorija: searchKategorija) ){ lijek in
                            NavigationLink(
                                destination: LijekView(lijek: lijek , supstanc: "").navigationBarTitle("Detalji Lijeka", displayMode: .inline), label: {
                                    LijekRow(lijek : lijek )
                                }
                            )
                        }
                        .onAppear{
                            apiLijek().getLijekovi{
                                (lijekovi) in
                                apiKategorija().getKategorije{
                                    (kategorija) in
                                    
                                    let result = apiKategorija().dodajKategoriju(lijekovi: lijekovi, kategorije: kategorija)
                                    self.listaLijekova = result.0
                                    self.kategorija = result.1
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                .navigationTitle("Registar lijekova")
                .searchable(text: $searchText)
                .tabItem(){
                    Image(systemName: "pills.fill")
                    Text("Registracija lijekova")
                }
            }
        }
    
}

func searchLijek(Lijekovi : [Lijek] , search : String, kategorija : String) -> [Lijek]{
    var noviLijekovi : [Lijek] = Lijekovi
    let noviSearch = search.lowercased()
    for (index, item) in noviLijekovi.enumerated() {
        noviLijekovi[index].name =  item.name.lowercased()
    }
    noviLijekovi = kategorija == "" ? noviLijekovi : noviLijekovi.filter{$0.kategorija?.mark.contains(kategorija) ?? false}
    return  noviSearch == "" ? noviLijekovi : noviLijekovi.filter{$0.name.contains(noviSearch)}
}


struct ListaLijekovaView_Previews: PreviewProvider {
    static var previews: some View {
        ListaLijekovaView()
    }
}
