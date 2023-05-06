//
//  RecreationCenter.swift
//  TestApp
//
//  Created by Шарап Бамматов on 04.05.2023.
//

import Foundation

struct RecreationCenter: Codable {
    let success: Bool
    let error: Bool?
    let time: String
    let data: DataClass
}

struct DataClass: Codable {
    let geo: Geo
    let categories: [Category]
    let objects: [Object]
}

struct Category: Codable {
    let name: String
    let type: TypeCategory
    let icon: Icon
    let color: ColorName
    let count: Int
}

struct Geo: Codable {
    let lat, lon: Double
}

struct Object: Codable {
    let id: Int
    let name, description: String
    let image: String
    let type: TypeCategory
    let close: Bool
    let icon: Icon
    let color: ColorName
    let lat, lon: Double
    let workingHours: [WorkingHour]?

    enum CodingKeys: String, CodingKey {
        case id, name, description, image, type, close, icon, color, lat, lon
        case workingHours = "working_hours"
    }
}

struct WorkingHour: Codable {
    let days: [Int]?
    let from, to: String?
}

enum ColorName: String, Codable {
    case cyan10 = "cyan-10"
    case danger10 = "danger-10"
    case info10 = "info-10"
    case primary10 = "primary-10"
    case success10 = "success-10"
    case violet10 = "violet-10"
    case warning10 = "warning-10"
}

enum Icon: String, Codable {
    case rstBasketFill = "rst-basket-fill"
    case rstChildren = "rst-children"
    case rstFacesHappy = "rst-faces_happy"
    case rstFoodForkDrink = "rst-food-fork-drink"
    case rstMapMarker = "rst-map_marker"
    case rstStarsOutline = "rst-stars_outline"
    case rstSurprise = "rst-surprise"
}

enum TypeCategory: String, Codable {
    case child = "child"
    case food = "food"
    case fun = "fun"
    case gift = "gift"
    case infrastructure = "infrastructure"
    case place = "place"
    case shop = "shop"
}
