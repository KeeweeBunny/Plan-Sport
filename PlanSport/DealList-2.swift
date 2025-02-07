//
//  DealList.swift
//  AFP20251
//
//  Created by apprenant85 on 03/02/2025.
//

import Foundation


class DealList: ObservableObject {
    @Published var deals: [Deal]

    init(deals: [Deal] = []) {
        self.deals = deals
    }
}

var dealList = DealList(deals: [
    Deal(
        title: "Promotion protèges tibia Venum",
        description: "Protèges tibias Venum en promotion avec réduction de 50%",
        link: "https://example.com",
        price: 19.99,
        normalPrice: 39.99,
        promotionalCode: "JANUARY50",
        validityPeriod: "20/02/2025",
        disponibility: .inStock,
        category: "Équipement",
        image: "https://imgs.search.brave.com/gNpEizThfl4HiB7Wgs7l5IiEIWE6Be7V8Nqs4YrZDO4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NzFjWXRXMmZFY0wu/anBn",
        uploadTime: Date(),
        postedBy: "JohnDoe1",
        isFavorite: false
    ),
    Deal(
        title: "Isolat de protéines en poudre - 1kg",
        description: "Isolat de protéines en poudre CoreStrenght, réduction de 40% pour un lot de 2.",
        link: "https://example.com/protein",
        price: 20.99,
        normalPrice: 34.99,
        validityPeriod: "28/02/2025",
        disponibility: .inStock,
        category: "Alimentation",
        image: "https://contents.mediadecathlon.com/p2728550/k$bb3b6c71f6eb28a9104f0307ec97c6e9/sq/pure-whey-100-isolate-gout-vanille-2kg.jpg?format=auto&f=969x969",
        uploadTime: Date(),
        postedBy: "JaneDoe1",
        isFavorite: false
    ),
    
    Deal(
        title: "Machine de Musculation Multi fonction Decathlon",
        description: "Machine de Musculation Multi fonction Decathlonavec une réduction de 30%.",
        link: "",
        price: 699.99,
        normalPrice: 999.99,
        promotionalCode: "SAVE30",
        validityPeriod: "10/03/2025",
        disponibility: .inStock,
        category: "Matériel",
        image: "https://imgs.search.brave.com/y3Pz5GSO1MGDOT6hbqd90x-76esMBRW2bl0-625y7B0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NzFFSG1UZGJETkwu/anBn",
        uploadTime: Date(),
        postedBy: "AliceSmith1",
        isFavorite: false
    ),
    
    
    Deal(
        title: "Destockage Baskets Kawasaki ",
        description: "Exclu WEB - Basket Kawasaki (dispo. en deux coloris) offertes pour un minimum 100€ d'achat.",
        link: "",
        price: 0.0,
        normalPrice: 37.99,
        promotionalCode: "WHIPPIN_7RO11",
        validityPeriod: "15/03/2025",
        disponibility: .outOfStock,
        category: "Équipement",
        image: "https://contents.mediadecathlon.com/m7135064/k$8731726035d97504cec7bcb5d5cf0f82/sq/basket-cuir-kawasaki-retro-femme.jpg?format=auto&f=969x969",
        uploadTime: Date(),
        postedBy: "4Y0u_be",
        isFavorite: true
    ),
    
    
    Deal(
        title: "Vélo Elliptique en promotion ",
        description: "DOMYOS Vélo Elliptique d'entraînement 500 connecté",
        link: "",
        price: 299.0,
        normalPrice: 399.0,
        promotionalCode: "FLASH10",
        validityPeriod: "9/02/2025",
        disponibility: .outOfStock,
        category: "Équipement",
        image: "https://contents.mediadecathlon.com/p2837404/k$88be7285baaf4b655ca1ab59f29e67b3/sq/elliptique-dentrainement-500-connecte.jpg?format=auto&f=969x969",
        uploadTime: Date(),
        postedBy: "Admin",
        isFavorite: false
    ),
    
    
    Deal(
        title: "Trottinette électrique en promotion",
        description: "trottinette electrique Ninebot G30 Max avec reduction de 200€",
        link: "",
        price: 499.0,
        normalPrice: 699.99,
        promotionalCode: "MI_CHOU",
        validityPeriod: "15/03/2025",
        disponibility: .outOfStock,
        category: "Équipement",
        image: "https://contents.mediadecathlon.com/p2337610/k$dbecb8526194d15bfca6798afb86492d/sq/trottinette-electrique-ninebot-g30-max.jpg?format=auto&f=969x969",
        uploadTime: Date(),
        postedBy: "Le M",
        isFavorite: true
    ),
    
    Deal(
        title: "Keepcool",
        description: "salle de sport",
        link: "https://web.keepcool.fr/offre-du-moment/",
        price: 19.99,
        normalPrice: 39.99,
        promotionalCode: "",
        validityPeriod: "",
        disponibility: .inStock,
        category: "activité",
        image: "https://web.keepcool.fr/wp-content/uploads/2022/07/zretrdgf_Plan-de-travail-1-600x184.png",
        uploadTime: Date(),
        postedBy: "Michel Coursil",
        isFavorite: false
    ),


    Deal(
        title: "Kiprun",
        description: "Veste chaude de running Femme - KIPRUN Run 900 Warm Regul Noir",
        link: "https://www.decathlon.fr/p/veste-chaude-de-running-femme-kiprun-run-900-warm-regul-vert-menthe/_/R-p-354481?mc=8881647&c=noir",
        price: 60.00,
        normalPrice: 80.00,
        promotionalCode: "",
        validityPeriod: "",
        disponibility: .inStock,
        category: "Veste",
        image: "https://contents.mediadecathlon.com/p2711086/k$cfef5e2c582317257fff2416f905d07a/sq/veste-chaude-de-running-femme-kiprun-run-900-warm-regul-noir.jpg?format=auto&f=969x969",
        uploadTime: Date(),
        postedBy: "Michel Coursil",
        isFavorite: false
    ),

    
    Deal(
        title: "Moufles de ski",
        description: "Promotion sur les moufles de ski decathlon taille enfant",
        link: "https://www.decathlon.fr/p/moufles-de-ski-enfant-chaudes-et-impermeables-550-noirs-jaunes-fluo/_/R-p-325620?mc=8587678&c=noir_jaune",
        price: 19.99,
        normalPrice: 25.00,
        promotionalCode: "",
        validityPeriod: "",
        disponibility: .inStock,
        category: "équipement",
        image: "https://contents.mediadecathlon.com/p2174229/k$ba4adf2da1d8868e3ebefd0f210cc98c/sq/moufles-de-ski-enfant-chaudes-et-impermeables-550-noirs-jaunes-fluo.jpg?format=auto&f=2400x2400",
        uploadTime: Date(),
        postedBy: "Michel Coursil",
        isFavorite: false
    ),

    Deal(
        title: "KIPSTA",
        description: "Collant thermique enfant",
        link: "https://www.decathlon.fr/p/collant-thermique-enfant-keepconfort-100-gris/_/R-p-330956?mc=8619329&c=noir",
        price: 9.90,
        normalPrice: 2.10,
        promotionalCode: "",
        validityPeriod: "",
        disponibility: .inStock,
        category: "",
        image: "https://contents.mediadecathlon.com/p2373388/k$808107c16fe59584e9ea45b386891805/sq/8619329.jpg?format=auto&f=640x640",
        uploadTime: Date(),
        postedBy: "Michel Coursil",
        isFavorite: false
    ),

    Deal(
        title: "Rockrider",
        description: "Vélo VTT électrique tout suspendu 29",
        link: "https://www.decathlon.fr/p/velo-vtt-electrique-tout-suspendu-29-e-expl-500-s-gris-metal/_/R-p-337428?mc=8732274&c=gris",
        price: 1999.00,
        normalPrice: 2499.00,
        promotionalCode: "",
        validityPeriod: "",
        disponibility: .inStock,
        category: "Matériel",
        image: "https://contents.mediadecathlon.com/p2623177/k$725a60bd2c9f4f079dd39b9ac3fc274a/sq/velo-vtt-electrique-tout-suspendu-29-e-expl-500-s-gris-metal.jpg?format=auto&f=969x969",
        uploadTime: Date(),
        postedBy: "Michel Coursil",
        isFavorite: false
    )
])

