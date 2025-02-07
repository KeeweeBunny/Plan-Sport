import SwiftUI
import PhotosUI

struct PosterBPScreen3: View {
    @State private var selectedImages: [UIImage] = []
    @State private var dealDescription: String = ""
    @State private var showImagePicker = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State var modaleFin = false
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
                Text("Ajoute une photo ainsi\nqu’une description pour\nmettre en avant ton\nBon Plan !")
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)
            .padding(.top, 10)

            HStack(spacing: 15) {
                ForEach(0..<2, id: \.self) { index in
                    Button(action: {
                        showImagePicker = true
                    }) {
                        ZStack {
                            if index < selectedImages.count {
                                Image(uiImage: selectedImages[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(12)
                                    .clipped()
                            } else {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 2, dash: [5]))
                                    .frame(width: 150, height: 150)
                                    .overlay(
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.gray)
                                            .font(.largeTitle)
                                    )
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 15) {
                Text("Description :")
                    .font(.headline)
                TextField("Décris ton bon plan...", text: $dealDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            

            HStack {
                Button(action: {
                    modaleFin = true
                }) {
                    Text("Continuer")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .sheet(isPresented: $modaleFin) {
                    ModalePosterBP()
                        .presentationDetents([.large])
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)

            Spacer()
        }
        .padding(.top)
        .photosPicker(isPresented: $showImagePicker, selection: $selectedItem)
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    if selectedImages.count < 2 {
                        selectedImages.append(image)
                    }
                }
            }
        }
    }
}

#Preview {
    PosterBPScreen3()
}

