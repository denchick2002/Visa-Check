//
//  Country.swift
//  Visa Check
//
//  Created by Денис Андриевский on 1/3/20.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let country = try? newJSONDecoder().decode(Country.self, from: jsonData)

import Foundation

// MARK: - Country
struct Country: Codable {
    var visaRequirements: [VisaRequirement]
}

// MARK: - NCountry
struct NCountry: Codable {
    var id: Int
    var name, alpha2Code, alpha3Code: String
    var numericCode: String?
    var slug, nationality, nationalitySlug: String
    var imageURL: String
    var capital, isdCode: String?
    var currencyName, currencyCode: String
    var region: Region
    var subregion: Subregion
    var population, lat, lng: String
    var city: String?
    var cityLat, cityLng, area, nearbyCountrySlugs: String
    var timeZones: String
    var formalName: String?
    var isIndependent: IsIndependent
    var developmentStatus: DevelopmentStatus
    var languageCodes, languageNames: String
    var countryVisaRanking: CountryVisaRanking?
    var createdAt, updatedAt: Date
    var visaProcessingURL: String?
    var countryTemperature: CountryTemperature?
    var travelAdvice: TravelAdvice?
    var visaSlug: String?
    var parentCountryID, visaSchemeID: Int?
    var currencySymbol: String?

    enum CodingKeys: String, CodingKey {
        case id, name, alpha2Code, alpha3Code, numericCode, slug, nationality, nationalitySlug
        case imageURL = "imageUrl"
        case capital
        case isdCode = "ISDCode"
        case currencyName, currencyCode, region, subregion, population, lat, lng, city, cityLat, cityLng, area, nearbyCountrySlugs, timeZones, formalName, isIndependent, developmentStatus, languageCodes, languageNames, countryVisaRanking, createdAt, updatedAt
        case visaProcessingURL = "visaProcessingUrl"
        case countryTemperature, travelAdvice, visaSlug
        case parentCountryID = "parentCountryId"
        case visaSchemeID = "visaSchemeId"
        case currencySymbol
    }
}

// MARK: - CountryTemperature
struct CountryTemperature: Codable {
    var id, countryID: Int
    var jan, feb, mar, apr: Double
    var may, jun, jul, aug: Double
    var sep, oct, nov, dec: Double
    var createdAt, updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case countryID = "countryId"
        case jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec, createdAt, updatedAt
    }
}

// MARK: - CountryVisaRanking
struct CountryVisaRanking: Codable {
    var countryID, visaFree, visaOnArrival, eVisa: Int
    var visaRequired, visaRefused, visaUnknown, visaEasyTotal: Int

    enum CodingKeys: String, CodingKey {
        case countryID = "countryId"
        case visaFree, visaOnArrival, eVisa, visaRequired, visaRefused, visaUnknown, visaEasyTotal
    }
}

enum DevelopmentStatus: String, Codable {
    case developed = "Developed"
    case developing = "Developing"
    case leastDeveloped = "Least Developed"
}

enum IsIndependent: String, Codable {
    case associatedWithNewZealand = "Associated with New Zealand"
    case commonwealthOfUS = "Commonwealth of US"
    case crownDependencyOfUK = "Crown dependency of UK"
    case inContention = "In contention"
    case partOfChina = "Part of China"
    case partOfDenmark = "Part of Denmark"
    case partOfFinland = "Part of Finland"
    case partOfFrance = "Part of France"
    case partOfNetherlands = "Part of Netherlands"
    case territoryOfAustralia = "Territory of Australia"
    case territoryOfFrance = "Territory of France"
    case territoryOfNorway = "Territory of Norway"
    case territoryOfUK = "Territory of UK"
    case territoryOfUS = "Territory of US"
    case yes = "Yes"
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum Subregion: String, Codable {
    case australiaAndNewZealand = "Australia and New Zealand"
    case caribbean = "Caribbean"
    case centralAmerica = "Central America"
    case centralAsia = "Central Asia"
    case centralEurope = "Central Europe"
    case easternAfrica = "Eastern Africa"
    case easternAsia = "Eastern Asia"
    case easternEurope = "Eastern Europe"
    case melanesia = "Melanesia"
    case micronesia = "Micronesia"
    case middleAfrica = "Middle Africa"
    case middleEast = "Middle East"
    case northernAfrica = "Northern Africa"
    case northernAmerica = "Northern America"
    case northernEurope = "Northern Europe"
    case polynesia = "Polynesia"
    case southAmerica = "South America"
    case southEasternAsia = "South-Eastern Asia"
    case southernAfrica = "Southern Africa"
    case southernAsia = "Southern Asia"
    case southernEurope = "Southern Europe"
    case westernAfrica = "Western Africa"
    case westernAsia = "Western Asia"
    case westernEurope = "Western Europe"
}

// MARK: - TravelAdvice
struct TravelAdvice: Codable {
    var id, countryID: Int
    var country: JSONNull?
    var adviceLevel: Int
    var adviceDate: Date
    var advice: String
    var adviceDescription: AdviceDescription
    var detailedAdvice: String
    var sourceURL: String
    var createdAt, updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case countryID = "countryId"
        case country, adviceLevel, adviceDate, advice, adviceDescription, detailedAdvice
        case sourceURL = "sourceUrl"
        case createdAt, updatedAt
    }
}

enum AdviceDescription: String, Codable {
    case doNotTravel = "Do not travel"
    case exerciseNormalSafetyPrecautions = "Exercise normal safety precautions"
    case highDegreeOfCaution = "High degree of caution"
    case reconsiderYourNeedToTravel = "Reconsider your need to travel"
}

// MARK: - VisaRequirement
struct VisaRequirement: Codable {
    var id, originCountryID: Int
    var originCountry: JSONNull?
    var destinationCountryID: Int
    var destinationCountry: NCountry
    var visaCategoryID: Int
    var visaCategory: VisaCategory
    var visaSubcategoryID: Int
    var duration: Duration
    var notes: String
    var totalVotes, initialVotes: Int
    var visaRequirementVote, exemptionVisaRequirement, dualVisaRequirement: JSONNull?
    var flightPrice: FlightPrice?
    var exchangePrice: ExchangePrice?
    var slug, website: String
    var visaName: VisaName
    var userNotes, visaQuestions: JSONNull?
    var createdAt, updatedAt: Date
    var visaProcessingAvailable: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case originCountryID = "originCountryId"
        case originCountry
        case destinationCountryID = "destinationCountryId"
        case destinationCountry
        case visaCategoryID = "visaCategoryId"
        case visaCategory
        case visaSubcategoryID = "visaSubcategoryId"
        case duration, notes, totalVotes, initialVotes, visaRequirementVote, exemptionVisaRequirement, dualVisaRequirement, flightPrice, exchangePrice, slug, website, visaName, userNotes, visaQuestions, createdAt, updatedAt, visaProcessingAvailable
    }
}

enum Duration: String, Codable {
    case empty = ""
    case the14Days = "14 days"
    case the14Days1Month = "14 days/ 1 month"
    case the15Days = "15 days"
    case the180Days = "180 days"
    case the183Days = "183 days"
    case the1Month = "1 month"
    case the1Year = "1 year"
    case the21Days = "21 days"
    case the28Days = "28 days"
    case the2Months = "2 months"
    case the30Days = "30 days"
    case the30Days8Days = "30 days / 8 days"
    case the31Days = "31 days"
    case the360Days = "360 days"
    case the3Months = "3 months"
    case the45Days = "45 days"
    case the4Months = "4 months"
    case the60Days = "60 days"
    case the6Weeks = "6 weeks"
    case the7Days = "7 days"
    case the90Days = "90 days"
    case unlimitedStay = "Unlimited stay"
    case upTo90Days = "up to 90 days"
}

// MARK: - ExchangePrice
struct ExchangePrice: Codable {
    var id, originCountryID, destinationCountryID: Int
    var originCurrencyCode: OriginCurrencyCode
    var destinationCurrencyCode: String
    var price: Double
    var quoteDateTime: Date

    enum CodingKeys: String, CodingKey {
        case id
        case originCountryID = "originCountryId"
        case destinationCountryID = "destinationCountryId"
        case originCurrencyCode, destinationCurrencyCode, price, quoteDateTime
    }
}

enum OriginCurrencyCode: String, Codable {
    case byn = "BYN"
    case rub = "RUB"
    case uah = "UAH"
}

// MARK: - FlightPrice
struct FlightPrice: Codable {
    var id, originCountryID, destinationCountryID, minPrice: Int
    var currency: OriginCurrencyCode
    var direct: Int
    var outboundCarrierIDS, outboundCarrierNames: String
    var outboundDate: Date
    var inboundCarrierIDS, inboundCarrierNames: String
    var inboundDate, quoteDateTime: Date

    enum CodingKeys: String, CodingKey {
        case id
        case originCountryID = "originCountryId"
        case destinationCountryID = "destinationCountryId"
        case minPrice, currency, direct
        case outboundCarrierIDS = "outboundCarrierIds"
        case outboundCarrierNames, outboundDate
        case inboundCarrierIDS = "inboundCarrierIds"
        case inboundCarrierNames, inboundDate, quoteDateTime
    }
}

// MARK: - VisaCategory
struct VisaCategory: Codable {
    var id: Int
    var name: Name
    var visaCategoryDescription: String
    var updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id, name
        case visaCategoryDescription = "description"
        case updatedAt
    }
}

enum Name: String, Codable {
    case eVisa = "E-visa"
    case visaFree = "Visa Free"
    case visaOnArrival = "Visa on Arrival"
    case visaRequired = "Visa Required"
}

enum VisaName: String, Codable {
    case e600OnlineVisitorVisa = "e600 Online Visitor Visa"
    case eVisa = "eVisa"
    case eVisaFreeVisaOnArrival = "eVisa / Free visa on arrival"
    case eVisaVisaOnArrival = "eVisa / Visa on arrival"
    case electronicAuthorization = "Electronic Authorization"
    case electronicVisa = "Electronic visa"
    case entryPermitOnArrival = "Entry Permit on arrival"
    case entryPermitRequired = "Entry permit required"
    case onlineVisa = "Online Visa"
    case permitRequired = "Permit required"
    case specialPermitRequired = "Special permit required"
    case touristCardRequired = "Tourist card required"
    case visaNameEVisa = "e-Visa"
    case visaNotRequired = "Visa not required"
    case visaOnArrival = "Visa on arrival"
    case visaRequired = "Visa required"
    case visitorSPermitOnArrival = "Visitor's Permit on arrival"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
