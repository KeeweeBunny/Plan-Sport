import SwiftUI

struct PageMesBonsplans: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Bons plans en cours")
                .font(.title)
                .bold()
            ScrollView {
                HStack {
                    Spacer()
                    Text("Vous n'avez posté aucun bon plan")
                    Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                    Spacer()
                }
                .padding()
                .foregroundStyle(.green)
                NavigationLink(destination: PostDealPage(deal: dealList.deals[0])) {
                    HStack {
                    }
                   
                }
               
                    
               
            }
            .padding()
        }
            .navigationTitle("Mes Bons Plans")
    }
}
#Preview {
    PageMesBonsplans()
}
