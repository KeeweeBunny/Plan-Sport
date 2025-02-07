
import SwiftUI
import PhotosUI

struct PageInfo: View {
    @ObservedObject var user: UserProfile = currentUser
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var address: String = ""
    @State var showAlert: Bool = false
    
    @State private var selectedImage: PhotosPickerItem? = nil
    @State private var profileImage: Image? = nil

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        VStack {
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 175, height: 175)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            } else {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 175, height: 175)
                                    .foregroundColor(.gray)
                            }
                            
                            PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                                Text("Modifier photo de profil")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            }
                        }
                        Spacer()
                    }
                    
                    Spacer()

                    EditableInfoField(title: "Nom d'utilisateur", text: $username)
                    EditableInfoField(title: "Adresse Mail", text: $email)
                    EditableInfoField(title: "Numéro de téléphone", text: $phoneNumber)
                    EditableInfoField(title: "Nom", text: $lastname)
                    EditableInfoField(title: "Prénom", text: $firstname)
                    EditableInfoField(title: "Adresse postale", text: $address)

                    Button(action: {
                        saveChanges()
                        showAlert.toggle()
                    }) {
                        Text("Enregistrer les modifications")
                            .padding()
                            .frame(width: 250)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .bold()
                    }
                    .alert("Les modifications ont bien étés enregistrées !", isPresented: $showAlert) {
                        Button("OK", role: .cancel) {showAlert = false}
                    }
                    
                    Spacer()
                }
                .padding()
                .onAppear {
                    username = user.username
                    email = user.email
                    phoneNumber = user.phoneNumber ?? ""
                    firstname = user.firstName ?? ""
                    lastname = user.lastName ?? ""
                    address = user.address ?? ""
                    
                    if let profilePicture = user.profilePicture, let uiImage = UIImage(data: Data(base64Encoded: profilePicture) ?? Data()) {
                        profileImage = Image(uiImage: uiImage)
                    }
                }
                .onChange(of: selectedImage) { newValue in
                    Task {
                        if let data = try? await newValue?.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                            profileImage = Image(uiImage: uiImage)
                            user.profilePicture = data.base64EncodedString() // Sauvegarder l'image en base64
                        }
                    }
                }
            }
            .navigationTitle("Mes informations")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func saveChanges() {
        user.username = username
        user.email = email
        user.phoneNumber = phoneNumber
        user.firstName = firstname
        user.lastName = lastname
        user.address = address
        
        print("Profil mis à jour !")
    }
}

struct InfoField: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Text(value)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}


struct EditableInfoField: View {
    var title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.black)
                .font(.subheadline)
            
            TextField(title, text: $text)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}


#Preview {
    PageInfo(user: UserProfile(username: "Admin", password: "122333", email: "john@example.com"))
}
