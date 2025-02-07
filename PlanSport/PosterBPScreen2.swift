import SwiftUI

struct PosterBPScreen2: View {
    @State private var dealTitle: String = ""
    @State private var dealPrice: String = ""
    @State private var regularPrice: String = ""
    @State private var promoCode: String = ""
    @State private var validityDate: String = ""
    @State private var isOnline: Bool = true
    @State var posterBP3 = false
    @State private var close = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
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
            .padding(.horizontal)

            VStack(spacing: 8) {
                Text("Commençons par : le commencement")
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)
            .padding(.top, 10)

            VStack(alignment: .leading, spacing: 15) {
                Text("Titre (obligatoire)")
                    .font(.headline)
                TextField("Titre du bon plan...", text: $dealTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Détails de prix €")
                    .font(.headline)
                TextField("Prix du bon plan...", text: $dealPrice)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Prix habituel €")
                    .font(.headline)
                TextField("Prix habituel...", text: $regularPrice)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Code Promo")
                    .font(.headline)
                TextField("Code promo (si disponible)...", text: $promoCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Date de validité du bon plan")
                    .font(.headline)
                TextField("Du: xx/xx/xx      Au: xx/xx/xx", text: $validityDate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Disponibilité du bon plan")
                    .font(.headline)
                
                HStack {
                    Button(action: { isOnline = true }) {
                        Text("En ligne")
                            .foregroundColor(isOnline ? .white : .blue)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(isOnline ? Color.blue : Color.clear)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: isOnline ? 0 : 2))
                    }
                    
                    Button(action: { isOnline = false }) {
                        Text("En magasin")
                            .foregroundColor(!isOnline ? .white : .blue)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(!isOnline ? Color.blue : Color.clear)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: !isOnline ? 0 : 2))
                    }
                }
            }
            .padding(.horizontal)

            HStack {
                Button(action: {
                    posterBP3 = true
                }) {
                    Text("Continuer")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .sheet(isPresented: $posterBP3) {
                    PosterBPScreen3()
                        .presentationDetents([.large])
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)

            Spacer()
        }
        .padding(.top)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PosterBPScreen2()
}
