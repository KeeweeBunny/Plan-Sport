import SwiftUI
import MapKit


struct Offer1: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var requiredLevel: Int
}

struct BPGeographiqueScreen: View {
    @State private var searchText: String = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 50.6292, longitude: 3.0573),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    @State private var offers: [Offer1] = [
        Offer1(title: "Réduction 20%", description: "Réduction sur tous les produits", requiredLevel: 5),
        Offer1(title: "Accès VIP", description: "Entrée gratuite à un événement exclusif", requiredLevel: 15)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "minus")
                .resizable()
                .frame(width: 150, height: 10)
                .foregroundStyle(.black.opacity(0.1))
            Text("Bons plans géographiques")
                .font(.title)
                .bold()
            HStack {
                Spacer()
                TextField("Rechercher...", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                Spacer()
            }
            .padding(.horizontal)
            
            Map(coordinateRegion: $region)
                .frame(height: 350)
                .cornerRadius(15)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Suggestions pour vous")
                    .font(.headline)
                    .padding(.leading)
                
                ForEach(offers) { offer in
                    HStack {
                        Image(systemName: "gift.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.purple)
                        
                        VStack(alignment: .leading) {
                            Text(offer.title)
                                .font(.subheadline)
                                .bold()
                            Text(offer.description)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Text("Niveau \(offer.requiredLevel)")
                            .font(.caption)
                            .padding(6)
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding()
                    .background(Color.purple.opacity(0.05))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }
            
            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    BPGeographiqueScreen()
}
