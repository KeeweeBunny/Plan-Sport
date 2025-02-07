import SwiftUI

struct HelpItem: Identifiable {
    let id = UUID()
    var title: String
    var description: String
}

struct HelpPage: View {
    @State private var searchText: String = ""
    
    let helpItems: [HelpItem] = [
        HelpItem(title: "Pass'sport", description: "Une aide financière pour les activités sportives."),
        HelpItem(title: "Coupon sport", description: "Réductions pour les équipements sportifs."),
        HelpItem(title: "Aide locale", description: "Soutien pour les clubs sportifs régionaux."),
        HelpItem(title: "Bourse jeune talent", description: "Soutien pour les jeunes sportifs prometteurs."),
        HelpItem(title: "Equipement subventionné", description: "Financement partiel pour l'achat d'équipements.")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "minus")
                .resizable()
                .frame(width: 150, height: 10)
                .foregroundStyle(.black.opacity(0.1))
            Text("Aides disponibles")
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
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Aides disponibles")
                        .font(.headline)
                        .padding(.leading)
                    
                    ForEach(helpItems) { help in
                        HStack {
                            Image(systemName: "figure.walk")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                            
                            VStack(alignment: .leading) {
                                Text(help.title)
                                    .font(.headline)
                                Text(help.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .background(Color.green.opacity(0.05))
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    HelpPage()
}
