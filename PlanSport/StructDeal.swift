//
//  StructDeal.swift
//  AFP20251
//
//  Created by apprenant85 on 30/01/2025.
//


import Foundation


class Deal: Identifiable, ObservableObject   {
    var id = UUID()
    @Published var title: String
    @Published var description: String
    @Published var link: String?
    @Published var price: Double
    @Published var normalPrice: Double?
    @Published var promotionalCode: String?
    @Published var validityPeriod: String?
    @Published var disponibility: Availability
    @Published var category: String
    @Published var image: String
    @Published var uploadTime: Date
    @Published var postedBy: String
    @Published var isFavorite: Bool
    
    init(title: String, description: String, link: String? = nil, price: Double, normalPrice: Double? = nil, promotionalCode: String? = nil, validityPeriod: String? = nil, disponibility: Availability, category: String, image: String, uploadTime: Date, postedBy: String, isFavorite: Bool) {
            self.title = title
            self.description = description
            self.link = link
            self.price = price
            self.normalPrice = normalPrice
            self.promotionalCode = promotionalCode
            self.validityPeriod = validityPeriod
            self.disponibility = disponibility
            self.category = category
            self.image = image
            self.uploadTime = uploadTime
            self.postedBy = postedBy
            self.isFavorite = isFavorite
        }
}

enum Availability: String {
    case inStock = "En stock"
    case outOfStock = "Rupture de stock"
}









