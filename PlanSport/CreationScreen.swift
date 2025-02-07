//
//  CreationScreen.swift
//  afp20251
//
//  Created by apprenant77 on 28/01/2025.
//

import SwiftUI

struct CreationScreen: View {
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var isAccountCreated: Bool = false
    @ObservedObject var user = currentUser
    @Binding var showLoading: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Image("LogoPlanSport")
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(20)
            
            Text("Bienvenue chez nous !")
                .font(.title)
                .bold()
                .padding()
            
            Text("Adresse e-mail")
            TextField("Ici votre email", text: $email)
                .padding()
                .frame(width: 300)
                .background(.gray.opacity(0.3))
                .cornerRadius(30)
            
            Text("Nom d'utilisateur")
            TextField("votre nom d'utilisateur", text: $name)
                .padding()
                .frame(width: 300)
                .background(.gray.opacity(0.3))
                .cornerRadius(30)
            
            Text("Mot De Passe")
            SecureField("votre mot de passe", text: $password)
                .padding()
                .frame(width: 300)
                .background(.gray.opacity(0.3))
                .cornerRadius(30)
            
            Spacer()
            
            
            Button {
                user.username = name
                user.password = password
                user.email = email
                
                isAccountCreated = true
            } label: {
                Text("Création du compte")
                    .padding()
                    .frame(width: 200)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(30)
                    .foregroundStyle(.black)
                    .bold()
            }
            .alert(isPresented: $isAccountCreated) {
                            Alert(title: Text("Compte Créé"), message: Text("Votre compte a bien été enregistré."), dismissButton: .default(Text("OK")))
                        }
            
            
            Spacer()
            
            
            NavigationLink(destination: ConnexionScreen(showLoading: $showLoading)) {
                VStack {
                    Text("Vous avez déjà un compte ?")
                        .foregroundStyle(.black)
                    Text("Se connecter")
                        .foregroundStyle(.blue)
                        .bold()
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CreationScreen(showLoading: .constant(true))
}
