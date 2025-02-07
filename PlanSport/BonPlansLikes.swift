import SwiftUI

struct LikedDeal: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: String
    var isLiked: Bool
    var pendingDeletion: Bool = false
}

class LikedDealsViewModel: ObservableObject {
    @Published var likedDeals: [LikedDeal] = [
        LikedDeal(title: "Destockage Baskets Kawasaki", description: "Exclu WEB - Basket Kawasaki (dispo. en deux coloris) offertes pour un minimum 100€ d'achat.", image: "https://contents.mediadecathlon.com/m7135064/k$8731726035d97504cec7bcb5d5cf0f82/sq/basket-cuir-kawasaki-retro-femme.jpg?format=auto&f=969x969", isLiked: true),
        LikedDeal(title: "Trottinette électrique en promotion", description: "trottinette electrique Ninebot G30 Max avec reduction de 200€", image: "https://contents.mediadecathlon.com/p2337610/k$dbecb8526194d15bfca6798afb86492d/sq/trottinette-electrique-ninebot-g30-max.jpg?format=auto&f=969x969", isLiked: true)
    ]
    
    func toggleLike(deal: LikedDeal) {
        if let index = likedDeals.firstIndex(where: { $0.id == deal.id }) {
            if likedDeals[index].isLiked {
                likedDeals[index].isLiked = false
                likedDeals[index].pendingDeletion = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    if let updatedIndex = self.likedDeals.firstIndex(where: { $0.id == deal.id }) {
                        if self.likedDeals[updatedIndex].pendingDeletion {
                            self.likedDeals.remove(at: updatedIndex)
                        }
                    }
                }
            } else {
                likedDeals[index].isLiked = true
                likedDeals[index].pendingDeletion = false
            }
        }
    }
}

struct LikedDealsPage: View {
    @StateObject private var viewModel = LikedDealsViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Text("Bons Plans Likés")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }
            .padding(.horizontal)
            
            if viewModel.likedDeals.isEmpty {
                VStack {
                    Image(systemName: "heart.slash.fill")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                    Text("Aucun bon plan liké")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding()
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        ForEach(viewModel.likedDeals) { deal in
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(deal.title)
                                        .font(.headline)
                                    
                                    Text(deal.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                
                                Button(action: {
                                    viewModel.toggleLike(deal: deal)
                                }) {
                                    Image(systemName: deal.isLiked ? "heart.fill" : "heart")
                                        .foregroundColor(deal.isLiked ? .red : .gray)
                                        .font(.title)
                                }
                            }
                            .padding()
                            .background(Color.red.opacity(0.05))
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    LikedDealsPage()
}
