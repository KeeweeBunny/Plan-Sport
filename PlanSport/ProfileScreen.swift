import SwiftUI

struct ProfileScreen: View {
    @State private var isContactModalPresented = false
    @ObservedObject var user: UserProfile = currentUser

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            if let profilePicture = user.profilePicture, let uiImage = UIImage(data: Data(base64Encoded: profilePicture) ?? Data()) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .foregroundColor(.gray)
                                .padding()
                                .overlay(
                                    Circle().stroke(Color.black, lineWidth: 2)
                                )
                        }
            Spacer()
            Text("\(user.username)")
                .font(.largeTitle)
                .bold()
            Spacer()
            NavigationLink(destination: PageInfo(user: user)) {
                Text("Mes informations")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(Color.black)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            NavigationLink(destination: PageMesBonsplans()) {
                Text("Mes bons plans")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(Color.black)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            NavigationLink(destination: MesRecompensesView()) {
                Text("Mes récompenses")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(Color.black)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Button(action: {
                isContactModalPresented = true
            }) {
                Text("Nous contacter")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(Color.black)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .sheet(isPresented: $isContactModalPresented) {
                ContactModalView()
                    .presentationDetents([.height(500)])
            }

            Spacer()
            Spacer()
        }
        .padding()
        .navigationTitle("Mon compte")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContactModalView: View {
    @Environment(\.dismiss) var dismiss
    @State private var nameOrEmail = ""
    @State private var message = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()
                Text("Nous contacter")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "multiply")
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                }
                .padding()
            }
            Text("Un problème ou une opinon à partager ? N'hesitez pas à nous la faire parvenir !")
                .bold()
                .multilineTextAlignment(.center)
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("Nom / identifiant / adresse mail")
                    .font(.subheadline)

                TextField("Entrez votre nom ou e-mail", text: $nameOrEmail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)

                Text("Message")
                    .font(.subheadline)

                ZStack(alignment: .topLeading) {
                    if message.isEmpty {
                        Text("Tapez votre message ici...")
                            .foregroundColor(.gray)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 5)
                    }
                    TextEditor(text: $message)
                        .frame(height: 100)
                        .opacity(message.isEmpty ? 0.85 : 1)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)

            Button(action: { dismiss() }) {
                Text("Envoyer")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .background(.gray.opacity(0.1))
    }
}

struct MonCompteView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(user: UserProfile(username: "Admin", password: "122333", email: "john@example.com"))
    }
}
