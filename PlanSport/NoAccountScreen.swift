//
//  NoAccountScreen.swift
//  afp20251
//
//  Created by apprenant77 on 28/01/2025.
//

//import SwiftUI
//
//struct NoAccountScreen: View {
//    var body: some View {
//        ZStack {
//            Color.gray.opacity(0.2).ignoresSafeArea()
//            VStack {
//                Spacer()
//                Image("LogoPlanSport")
//                    .resizable()
//                    .frame(width: 150, height: 150)
//                    .cornerRadius(20)
//                Text("Êtes-vous sûr de vouloir continuer sans compte utilisateur ?")
//                    .multilineTextAlignment(.center)
//                    .font(.title)
//                    .bold()
//                    .padding()
//                Text("Sans compte vous ne pourrez :")
//                Text("- Partager un bon plan")
//                Text("- Commenter un bon plan")
//                Text("- Liker un bon plan")
//                Text("- Gagner de l'expérience ainsi que de nombreuses résompenses")
//                    .multilineTextAlignment(.center)
//                Spacer()
//                NavigationLink(destination: ALaUneScreen()) {
//                    Text("Continuer")
//                        .padding()
//                        .frame(width: 200)
//                        .background(.black)
//                        .cornerRadius(30)
//                        .foregroundStyle(.white)
//                        .bold()
//                }
//                Spacer()
//                HStack {
//                    NavigationLink(destination: CreationScreen()) {
//                        Text("< S'inscrire")
//                            .foregroundStyle(.black)
//                            .padding()
//                    }
//                    Spacer()
//                    NavigationLink(destination: ConnexionScreen()) {
//                        Text("Se connecter >")
//                            .foregroundStyle(.black)
//                            .padding()
//                    }
//                }
//            }
//            .navigationTitle("Sans compte")
//        }
//    }
//}
//
//#Preview {
//    NoAccountScreen()
//}
