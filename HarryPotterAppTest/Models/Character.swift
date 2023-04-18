//
//  File.swift
//  StarWarsAppTest
//
//  Created by Светлана Сенаторова on 17.04.2023.
//

import Foundation

struct Character: Codable {
    let id: String?
    let name: String?
    let alternateNames: [String]?
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let ancestry:String?
    let eyeColour: String?
    let hairColour: String?
    let patronus: String?
    let hogwartsStudent: Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let alternateActors:[String]?
    let alive: Bool?
    let image: String?

    static var numberOfParameters: [String] {
        ["Image", "Name", "Alternate Names", "Species", "Gender", "House", "Date Of Birth", "Year Of Birth", "Ancestry", "Eye Colour", "Hair Colour", "Patronus", "Actor", "Alternate Actors"]
    }
}
