import SwiftUI

struct Offer {
    let title: String
    let description: String
    let requiredLevel: Int
}

struct Mission {
    let title: String
    let rewardXP: Int
}

struct MesRecompensesView: View {
    @State private var currentXP: Int = 120
    @State private var nextLevelXP: Int = 200
    @State private var currentLevel: Int = 5
    @State private var animatedXP: Int = 0
    @State var bounce: Bool = false
    @State var rotate: Bool = false
    
    let offers: [Offer] = [
        Offer(title: "Réduction 10%", description: "Réduction sur ton abonnement", requiredLevel: 10),
        Offer(title: "Accès VIP", description: "Accède à un événement exclusif", requiredLevel: 20),
        Offer(title: "Bonus Achat", description: "Obtiens un bonus de 5€", requiredLevel: 30)
    ]
    
    let missions: [Mission] = [
        Mission(title: "Publier un article", rewardXP: 10),
        Mission(title: "Partager une offre", rewardXP: 15),
        Mission(title: "Inviter un ami", rewardXP: 20)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Text("Mes Récompenses")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding(.top)
                
                VStack {
                    ZStack {
                        Circle()
                            .stroke(Color.blue.opacity(0.3), lineWidth: 15)
                        Circle()
                            .trim(from: 0, to: CGFloat(animatedXP) / CGFloat(nextLevelXP))
                            .stroke(Color.blue, lineWidth: 15)
                            .rotationEffect(.degrees(-90))
                            .animation(.easeInOut(duration: 1.5), value: animatedXP)
                        
                        VStack {
                            Text("Niveau \(currentLevel)")
                                .font(.headline)
                                .bold()
                            Text("\(animatedXP) XP")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: 120, height: 120)
                    
                    Spacer()
                    Text("Niveau actuel")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Text("Niveau suivant")
                        .font(.headline)
                    Text("\(nextLevelXP) XP")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                
                Text("Bons Plans Déblocables")
                    .font(.headline)
                    .padding(.top)
                
                GeometryReader { geometry in
                    HStack(spacing: 8) {
                        ForEach(offers, id: \.title) { offer in
                            VStack {
                                Image(systemName: "gift.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.purple)
                                    .offset(y: bounce ? 0 : 10)
                                        .scaleEffect(bounce ? 1.1 : 1.0)
                                        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0), value: bounce)
                                        .onAppear {
                                            bounce.toggle()
                                        }
                                
                                Text(offer.title)
                                    .font(.subheadline)
                                    .bold()
                                
                                Text(offer.description)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Text("Niveau \(offer.requiredLevel)")
                                    .font(.caption)
                                    .padding(6)
                                    .background(Color.purple.opacity(0.1))
                                    .cornerRadius(8)
                            }
                            .padding()
                            .frame(width: (geometry.size.width - 45) / 3)
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 200)
                
                Text("Missions à compléter")
                    .font(.headline)
                    .padding(.top)
                
                ForEach(missions, id: \.title) { mission in
                    HStack {
                        Image(systemName: "checkmark.seal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.green)
                            .rotationEffect(.degrees(rotate ? 360 : 0))
                            .animation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0), value: rotate)
                            .onAppear {
                                rotate.toggle()
                            }
                        
                        VStack(alignment: .leading) {
                            Text(mission.title)
                                .font(.subheadline)
                                .bold()
                            Text("Récompense : \(mission.rewardXP) XP")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Text("\(mission.rewardXP) / 5")
                            .font(.caption)
                            .padding(6)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding()
                    .background(Color.green.opacity(0.05))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .onAppear {
            animatedXP = 0
            withAnimation(.easeOut(duration: 1.5)) {
                animatedXP = currentXP
            }
        }
        .navigationTitle("Mes Récompenses")
    }
}

#Preview {
    MesRecompensesView()
}
