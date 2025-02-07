//
//  LoadingScreen.swift
//  afp20251
//
//  Created by apprenant77 on 28/01/2025.
//

import SwiftUI

struct LoadingScreen: View {
    @Binding var showLoading: Bool
    @State var showAlert: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Image("backgroundPlanSport3")
                    .resizable()
                    .frame(height: 900)
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Image("LogoPlanSport")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                    NavigationLink(destination: ConnexionScreen(showLoading: $showLoading)) {
                        Text("Se Connecter")
                            .frame(width: 150)
                            .padding()
                            .foregroundStyle(.white)
                            .background(.black)
                            .cornerRadius(30)
                    }
                    NavigationLink(destination: CreationScreen(showLoading: $showLoading)) {
                        Text("S'inscrire")
                            .padding()
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Spacer()
                    HStack {
                        Spacer()
                        
                        Button( action: {
                            showAlert.toggle()
                        },label:  {
                            Text("Continuer sans compte >")
                                .foregroundStyle(.black)
                                .padding()
                        })
                    }
                    .alert("Êtes-vous sûr de vouloir continuer sans compte utilisateur ?\n\nSans compte vous ne pourrez :\n- Partager un bon plan\n- Commenter un bon plan\n- Liker un bon plan\n- Gagner de l'expérience ainsi que de nombreuses récompenses", isPresented: $showAlert) {
                        Button("Cancel", role: .destructive) { }
                        Button("Confirmer", role: .cancel) {
                            showLoading = false
                        }
                    }
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    LoadingScreen(showLoading: .constant(true))
}
