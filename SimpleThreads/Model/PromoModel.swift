//
//  PromoModel.swift
//  SimpleThreads
//
//  Created by RODERICK SIMMS on 10/25/22.
//

import Foundation

struct PromoModel: Identifiable {
    
    let id = UUID()
    let promoImage: String
    let promoCodeTitle: String
    let promoCode: String
    let daysRemaining: String
    let percentOff: String
}

extension PromoModel {
    
    static func all() -> [PromoModel] {
        return [
            PromoModel(promoImage: "promo_banner2", promoCodeTitle: "Military Discount", promoCode: "MIL20", daysRemaining: "5", percentOff: "20%"),
            PromoModel(promoImage: "promo_banner2", promoCodeTitle: "Summer Sale", promoCode: "SHOP40", daysRemaining: "2", percentOff: "40%"),
            PromoModel(promoImage: "promo_banner2", promoCodeTitle: "Winter Offer", promoCode: "SHOP10", daysRemaining: "10", percentOff: "10%"),
            PromoModel(promoImage: "promo_banner2", promoCodeTitle: "Black Friday Sale", promoCode: "SHOP30", daysRemaining: "4", percentOff: "30%"),
            PromoModel(promoImage: "promo_banner2", promoCodeTitle: "Christmas Sale", promoCode: "SHOP50", daysRemaining: "9", percentOff: "50%")
        ]
    }
}
