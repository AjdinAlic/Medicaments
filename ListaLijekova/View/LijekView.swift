//
//  LijekView.swift
//  ListaLijekova
//
//  Created by Ajdin on 19. 10. 2022..
//

import SwiftUI

struct LijekView: View {
    @State var lijek : Lijek
    @State  var supstanc : String
    var body: some View {
        ScrollView {
        VStack{
            VStack{
                topView(name : lijek.name ,shortDescription : lijek.shortDescription ?? "" ,kategorijaName: lijek.kategorija?.name ?? "NON" , atc: lijek.atc ?? "Non").multilineTextAlignment(.leading)
                supstanceView(dailyDoze: String(lijek.minimumDailyDose ?? 0))
                Text(supstanc)
                    .font(.custom(FontMenager.NeueFrutigerWorld.bold, size: 15))
                Divider()
                
                
                    Text(lijek.description ?? "Non-description")
                        .padding()
                        .font(.custom(FontMenager.NeueFrutigerWorld.regular, size: 20))
                    
                }
                Spacer()
            }
        }
        .onAppear{
            //lijek.id
            apiSubstance(id: lijek.id).getSubstancu{
                (supstance) in
                // main block
                    self.supstanc = supstance[0].name
            }
        }
    }
        
}

struct topView : View {
   var  name : String
    var shortDescription : String
    var kategorijaName : String
    var atc : String = ""
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image("Tablete")
                    .resizable()
                    .clipShape(
                        RoundedRectangle(cornerRadius:  1)
                    )
                    .scaledToFit()
                    .frame(height: 100)
                    .padding()
                    .shadow(radius: 10)
                    
                    
                VStack(alignment: .leading){
                    Text("\(name.capitalized)")
                    Text("\(atc) -\(kategorijaName)")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                
            }
            
            Text("\(shortDescription)")
                .padding(.leading)
            Divider()
            
        }
        .padding()
    }
}

struct supstanceView : View {
    var dailyDoze : String
    var body: some View {
        HStack{
            VStack{
                    Text("Aktivna supstanca")
                    .multilineTextAlignment(.center)
                ZStack{
                Rectangle()
                        .fill(.purple)
                        .frame(width: 100, height: 50)
                        .cornerRadius(8)
                    Text("/")
                        .frame(width: 100, height: 50)
                }
            }
            VStack{
                Text("Omjer aktivne supstance")
                    .multilineTextAlignment(.center)
                ZStack{
                    Rectangle()
                        .fill(.green)
                        .frame(width: 100, height: 50)
                        .cornerRadius(8)
                    Text("/")
                        .frame(width: 100, height: 50)
                }
                
            }
            VStack {
                Text("Preporucena dnevna doza")
                    .multilineTextAlignment(.center)
                ZStack{
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 100, height: 50)
                        .cornerRadius(8)
                    Text(dailyDoze == "0" ? "/" : dailyDoze)
                        .frame(width: 100, height: 50)
                }
            }
            
        }
        Divider()
            
    }
    
}

struct LijekView_Previews: PreviewProvider {
    static var previews: some View {
        LijekView(lijek: Lijek(id:17,name:"ime lijeka",shortDescription: "Kratki opis"),supstanc: "Supstanca" )
    }
}
