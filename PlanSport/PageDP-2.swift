import SwiftUI

struct PostDealPage: View {
    var deal: Deal
    @Environment(\.dismiss) var dismiss
    @State var text: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                    Spacer()
                    Text(deal.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 20)
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "multiply")
                            .resizable()
                            .frame(width: 20, height: 20)
                            
                    })
                }
                
                AsyncImage(url: URL(string: deal.image)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 200)
                .cornerRadius(10)
                .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.headline)
                    Text(deal.description)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .font(.title2)
                }
                
                HStack{
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Lien du bon plan")
                            .font(.headline)
                        if let validLink = deal.link, let url = URL(string: validLink) {
                            Link(validLink, destination: url)
                        } else {
                            Text("Lien invalide")
                                .foregroundColor(.red)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Prix")
                            .font(.headline)
                        Text("\(deal.price, specifier: "%.2f")€")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .font(.title2)
                    }
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Commentez le bon plan")
                        .font(.headline)
                    TextField("Entrez un commentaire", text: $text)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .font(.title2)
                }
            }
            .padding()
        }
        .navigationTitle("Détails du bon plan")
    }
}

#Preview {
    PostDealPage(deal: dealList.deals.first!)
}
