//
//  ModaleFiltre.swift
//  afp20251
//
//  Created by apprenant77 on 30/01/2025.
//

import SwiftUI

struct ModaleFiltre: View {
    @State private var close = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack {
            Spacer()
            Spacer()
            Text("Catégories")
                .font(.title)
                .bold()
                .padding()
            Spacer()
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "multiply")
                    .padding()
                    .font(.system(size: 30))
            })
        }
        ScrollView {
            Button(action: {
                
            }, label: {
                HStack {
                    Text("Sport")
                    Image(systemName: "figure.run")
                }
                .foregroundStyle(.black)
            })
            .padding()
            Divider()
            Button(action: {
                
            }, label: {
                HStack {
                    Text("Equipement")
                    Image(systemName: "duffle.bag.fill")
                }
                .foregroundStyle(.black)
            })
            .padding()
            Divider()
            Button(action: {
                
            }, label: {
                HStack {
                    Text("Administratif sportif")
                    Image(systemName: "clipboard.fill")
                }
                .foregroundStyle(.black)
            })
            .padding()
            Divider()
            Button(action: {
                
            }, label: {
                HStack {
                    Text("Accessibilté")
                    Image(systemName: "figure.roll")
                }
                .foregroundStyle(.black)
            })
            .padding()
            Divider()
            Button(action: {
                
            }, label: {
                HStack {
                    Text("Evénement")
                    Image(systemName: "party.popper.fill")
                }
                .foregroundStyle(.black)
            })
            .padding()
        }
    }
}

#Preview {
    ModaleFiltre()
}
