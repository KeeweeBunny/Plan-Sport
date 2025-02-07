//
//  ModalePosterBP.swift
//  afp20251
//
//  Created by apprenant77 on 31/01/2025.
//

import SwiftUI

struct ModalePosterBP: View {
    @Environment(\.dismiss) var dismiss
    @State var navigateToAcceuil = false
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "multiply")
                    .padding()
                    .font(.system(size: 30))
            })
            Spacer()
            
            Text("Poster un bon plan")
                .font(.title2)
                .bold()
            
            Spacer()
            Spacer()
        }
        .padding()
        Spacer()
        HStack {
            Text("👏🎉")
                .font(.largeTitle)
            Text("Merci pour votre ajout !")
                .font(.largeTitle).bold()
                .multilineTextAlignment(.center)
            Text("🎉👏")
                .font(.largeTitle)
        }
        .padding()
        HStack {
            Spacer()
            Text("Votre bon plan sera rapidement examiné par un membre de notre équipe avant d'être visible par les autres utilisateurs !")
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
        Spacer()
        Button(action: {
            navigateToAcceuil = true
        }, label: {
            Text("Retourner à l'acceuil")
                .padding()
                .background(.blue)
                .font(.system(size: 20))
                .cornerRadius(20)
                .foregroundStyle(.white)
        })
        .fullScreenCover(isPresented: $navigateToAcceuil) {
            ALaUneScreen(showLoading: false)
        }
        Spacer()
    }
}

#Preview {
    ModalePosterBP()
}
