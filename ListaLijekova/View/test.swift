//
//  test.swift
//  ListaLijekova
//
//  Created by Ajdin on 21. 10. 2022..
//

import SwiftUI

struct test: View {
    init() {
            UINavigationBar.appearance().backgroundColor = .red
        }
    var listica : [String] = ["jedan","jedan","jedan","jedan"]
    var body: some View {
        NavigationView {
            ZStack {
                
                List(listica, id: \.self){list in
                    NavigationLink(destination: LijekRow(lijek: Lijek()),
                                   label: {Text("Example")}
                    )
                    
                    
                }
                       
                       
                   }
            
                   .navigationBarTitle("titl")
               }
       
    }
    
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
