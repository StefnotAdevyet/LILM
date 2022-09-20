//
//  Style.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import Foundation

enum GarmentStyle: String, Hashable {
    case alpaca
    case cashmere
    case cotton
    case jersey
    case linen
    case pashmina
    case satin
    case silk
    case wool

    var description: String {
        switch self {
            case .alpaca: return NSLocalizedString("Alpaca", comment: "Alpaca")
            case .cashmere: return NSLocalizedString("Cashmere", comment: "Cashmere")
            case .cotton: return NSLocalizedString("Cotton", comment: "Cotton")
            case .jersey: return NSLocalizedString("Jersey", comment: "Jersey")
            case .linen: return NSLocalizedString("Linen", comment: "Linen")
            case .pashmina: return NSLocalizedString("Pashmina", comment: "Pashmina")
            case .satin: return NSLocalizedString("Satin", comment: "Satin")
            case .silk: return NSLocalizedString("Silk", comment: "Silk")
            case .wool: return NSLocalizedString("Wool", comment: "Wool")
        }
    }
}
