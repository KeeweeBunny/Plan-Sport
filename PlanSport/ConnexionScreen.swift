//
//  ConnexionScreen.swift
//  afp20251
//
//  Created by apprenant77 on 28/01/2025.
//

import SwiftUI

struct ConnexionScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var isAuthenticated: Bool = false
    @State var showAlert: Bool = false
    @ObservedObject var user = currentUser
    @Binding var showLoading: Bool
    
    @AppStorage("isAuthenticated") var isAuthenticatedStorage: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("LogoPlanSport")
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
            Text("Bon retour parmi nous !")
                .font(.title)
                .bold()
                .padding()
            Spacer()
            Text("Adresse e-mail")
            TextField("Adresse mail", text: $email)
                .padding()
                .frame(width: 300)
                .background(.gray.opacity(0.3))
                .cornerRadius(30)
            Spacer()
            Text("Mot de passe")
            SecureField("Mot de passe", text: $password)
                .padding()
                .frame(width: 300)
                .background(.gray.opacity(0.3))
                .cornerRadius(30)
            Spacer()
            Button(action: {
                if email == user.email && password == user.password {
                    isAuthenticated = true
                    currentUser = user
                    showLoading = false
                }
                showAlert = !isAuthenticated
                
                
            }, label: {
                Text("Se connecter")
                    .padding()
                    .frame(width: 200)
                    .background(isAuthenticated ? .green : .gray.opacity(0.3))
                    .cornerRadius(30)
                    .foregroundStyle(.black)
                    .bold()
            })
            .alert(isPresented: $showAlert) {
                         Alert(title: Text("Erreur"), message: Text("Email ou mot de passe incorrect"), dismissButton: .default(Text("OK")))
                     }
            Spacer()
            NavigationLink(destination: CreationScreen(showLoading: $showLoading)) {
                VStack {
                    Text("Vous n'avez pas encore de compte ?")
                        .foregroundStyle(.black)
                    Text("S'inscrire")
                        .foregroundStyle(.blue)
                        .bold()
                }
            }
            Spacer()
        }
        .navigationDestination(isPresented: $isAuthenticated) {
                        ALaUneScreen()
                    }
    }
}

#Preview {
    ConnexionScreen(showLoading: .constant(true))
}
