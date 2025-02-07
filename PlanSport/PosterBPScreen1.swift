import SwiftUI

struct PosterBPScreen1: View {
    @State private var dealLink: String = ""
    @State var posterBP2 = false
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Text("Poster un bon plan")
                    .font(.title2)
                    .bold()
                Spacer()
            }
            .padding(.horizontal)

            VStack(spacing: 8) {
                Text("Partage un bon plan avec toute la communauté")
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Text("Renseigne le lien de ton Bon Plan ci-dessous:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.top, 10)

            TextField("Colle le lien ici...", text: $dealLink)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.top, 100)
            Button(action: {
                posterBP2 = true
            }, label: {
                Text("Continuer")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            })
            .padding(.horizontal)
            .padding(.top, 10)
            .sheet(isPresented: $posterBP2) {
                PosterBPScreen2()
                    .presentationDetents([.large])
            }

            Button(action: {
                posterBP2 = true
            }) {
                Text("Je n’ai pas de lien >")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
            .padding(.top, 5)
            .sheet(isPresented: $posterBP2) {
                PosterBPScreen2()
                    .presentationDetents([.large])
            }

            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    PosterBPScreen1()
}

