//
//  ALaUneScreen.swift
//  afp20251
//
//  Created by apprenant77 on 28/01/2025.
//

import SwiftUI

struct ALaUneScreen: View {
    @State private var BPGeograph = false
    @State private var aidesDispo = false
    @State var recherche: String = ""
    @State var modaleDetail: Bool = false
    @State var dealSelected: Deal = dealList.deals[0]
    @State var showLoading: Bool = true
    @State var filter: Bool = false
    
    
    @ObservedObject var user: UserProfile = currentUser
    @ObservedObject var deals = dealList
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Button(action: {
                        filter = true
                    }, label: {
                        Image(systemName: "tag.fill")
                            .padding()
                            .font(.system(size: 30))
                            .foregroundStyle(.blue)
                    })
                    .sheet(isPresented: $filter) {
                        ModaleFiltre()
                            .presentationDetents([.medium])
                    }
                    Spacer()
                    TextField("Rechercher...", text: $recherche)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                    Spacer()
                    NavigationLink(destination: ProfileScreen(user: user)) {
                        if let profilePicture = user.profilePicture, let uiImage = UIImage(data: Data(base64Encoded: profilePicture) ?? Data()) {
                            Image(uiImage: uiImage)
                                .resizable().scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.blue, lineWidth: 1))
                                .padding()
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(.blue)
                                .padding()
                        }
                    }
                }
                HStack {
                    Button(action: {
                        BPGeograph = true
                    }, label: {
                        Text("BP Géographiques")
                            .foregroundStyle(.blue)
                            .padding()
                            .bold()
                    })
                    .sheet(isPresented: $BPGeograph) {
                        BPGeographiqueScreen()
                            .presentationDetents([.height(750)])
                    }
                    Spacer()
                    Button(action: {
                        aidesDispo = true
                    }, label: {
                        Text("Aides disponibles")
                            .foregroundStyle(.blue)
                            .padding()
                            .bold()
                    })
                    .sheet(isPresented: $aidesDispo) {
                        HelpPage()
                            .presentationDetents([.height(750)])
                    }
                }
                Spacer()
                
                Text("Derniers Bon Plans 🔥")
                    .font(.title)
                    .bold()
                    .padding()
                
                
                ScrollView {
                    ForEach(filteredDeals) { deal in
                        
                        HStack {
                            HStack {
                                AsyncImage(url: URL(string: deal.image)) { image in
                                    image.resizable().scaledToFit()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 160, height: 110)
                                .cornerRadius(10)
                                
                                VStack(alignment: .leading) {
                                    Text(deal.title)
                                        .font(.headline)
                                        .bold()
                                    Text("\(deal.price, specifier: "%.2f")€")
                                        .foregroundColor(.green)
                                    Text(deal.description)
                                        .font(.subheadline)
                                        .lineLimit(2)
                                }
                                
                                Spacer()
                            }.onTapGesture {
                                dealSelected = deal
                                modaleDetail = true
                            }
                            HStack{
                                Button(action: {
                                    if let index = deals.deals.firstIndex(where: { $0.id == deal.id }) {
                                        deals.deals[index].isFavorite.toggle()
                                    }
                                }) {
                                    Image(systemName: deal.isFavorite ? "heart.fill" : "heart")
                                        .foregroundColor(deal.isFavorite ? .red : .gray)
                                }
                                
                                
                                
                            }
                            
                        }
                        .padding()
                    }
                }
                .sheet(isPresented: $modaleDetail) {
                    PostDealPage(deal: dealSelected)
                }
                HStack {
                    Spacer()
                    NavigationLink(destination: PosterBPScreen1()) {
                        VStack {
                            Image(systemName: "plus.viewfinder")
                                .font(.system(size: 30))
                            Text("Nouveau BP")
                        }
                        .foregroundStyle(.blue)
                    }
                    .frame(width: 100)
                    Spacer()
                    NavigationLink(destination: LikedDealsPage()) {
                        VStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 30))
                            Text("Mes favoris")
                        }
                        .foregroundStyle(.red)
                    }
                    .frame(width: 100)
                    Spacer()
                }
                .navigationTitle("Accueil")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(.hidden, for: .navigationBar)
                .fullScreenCover(isPresented: $showLoading){
                    LoadingScreen(showLoading: $showLoading)
                }
                
            }
            .navigationBarBackButtonHidden(true)
            
        }
        
        var filteredDeals: [Deal] {
            if recherche.isEmpty {
                return deals.deals
            } else {
                return deals.deals.filter { deal in
                    deal.title.localizedCaseInsensitiveContains(recherche) ||
                    deal.description.localizedCaseInsensitiveContains(recherche)
                }
            }
        }
    }
}

    
#Preview {
    ALaUneScreen(user: UserProfile(username: "Admin", password: "122333", email: "john@example.com"))
}

