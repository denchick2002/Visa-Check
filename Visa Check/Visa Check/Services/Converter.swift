//
//  Converter.swift
//  Visa Check
//
//  Created by Денис Андриевский on 1/3/20.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import Foundation

class Converter {
    
    func encode(country: Country) -> [[String: Any]] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-ddTHH:mm:ssZ"
        let visaRequirements = country.visaRequirements
        var encodedVisaRequirements = [[String: Any]]()
        visaRequirements.forEach { visaRequirement in
            encodedVisaRequirements.append([
                "id": visaRequirement.id,
                "originCountryID": visaRequirement.originCountryID,
                "destinationCountryID": visaRequirement.destinationCountryID,
                "destinationCountry":
                [
                    "id": visaRequirement.destinationCountry.id,
                    "name": visaRequirement.destinationCountry.name,
                    "alpha2Code": visaRequirement.destinationCountry.alpha2Code,
                    "alpha3Code": visaRequirement.destinationCountry.alpha3Code,
                    "numericCode": visaRequirement.destinationCountry.numericCode as Any,
                    "slug": visaRequirement.destinationCountry.slug,
                    "nationality": visaRequirement.destinationCountry.nationality,
                    "nationalitySlug": visaRequirement.destinationCountry.nationalitySlug,
                    "imageURL": visaRequirement.destinationCountry.imageURL,
                    "capital": visaRequirement.destinationCountry.capital as Any,
                    "isdCode": visaRequirement.destinationCountry.isdCode as Any,
                    "currencyName": visaRequirement.destinationCountry.currencyName,
                    "currencyCode": visaRequirement.destinationCountry.currencyCode,
                    "region": visaRequirement.destinationCountry.region.rawValue,
                    "subregion": visaRequirement.destinationCountry.subregion,
                    "population": visaRequirement.destinationCountry.population,
                    "lat": visaRequirement.destinationCountry.lat,
                    "lng": visaRequirement.destinationCountry.lng,
                    "city": visaRequirement.destinationCountry.city as Any,
                    "cityLat": visaRequirement.destinationCountry.cityLat,
                    "cityLng": visaRequirement.destinationCountry.cityLng,
                    "area": visaRequirement.destinationCountry.area,
                    "nearbyCountrySlugs": visaRequirement.destinationCountry.nearbyCountrySlugs,
                    "timeZones": visaRequirement.destinationCountry.timeZones,
                    "formalName": visaRequirement.destinationCountry.formalName as Any,
                    "isIndependent": visaRequirement.destinationCountry.isIndependent,
                    "developmentStatus": visaRequirement.destinationCountry.developmentStatus.rawValue,
                    "languageCodes": visaRequirement.destinationCountry.languageCodes,
                    "languageNames": visaRequirement.destinationCountry.languageNames,
                    "createdAt": dateFormatter.string(from: visaRequirement.destinationCountry.createdAt),
                    "updatedAt": dateFormatter.string(from: visaRequirement.destinationCountry.updatedAt),
                    "visaProcessingURL": visaRequirement.destinationCountry.visaProcessingURL as Any,
                    "countryTemperature":
                        [
                            "apr": visaRequirement.destinationCountry.countryTemperature?.apr as Any,
                            "aug": visaRequirement.destinationCountry.countryTemperature?.aug as Any,
                            "countryID": visaRequirement.destinationCountry.countryTemperature?.countryID as Any,
                            "createdAt": (visaRequirement.destinationCountry.countryTemperature != nil ? dateFormatter.string(from: visaRequirement.destinationCountry.countryTemperature!.createdAt) : nil) as Any,
                            "dec": visaRequirement.destinationCountry.countryTemperature?.dec as Any,
                            "feb": visaRequirement.destinationCountry.countryTemperature?.feb as Any,
                            "id": visaRequirement.destinationCountry.countryTemperature?.id as Any,
                            "jan": visaRequirement.destinationCountry.countryTemperature?.jan as Any,
                            "jul": visaRequirement.destinationCountry.countryTemperature?.jul as Any,
                            "jun": visaRequirement.destinationCountry.countryTemperature?.jun as Any,
                            "mar": visaRequirement.destinationCountry.countryTemperature?.mar as Any,
                            "may": visaRequirement.destinationCountry.countryTemperature?.may as Any,
                            "nov": visaRequirement.destinationCountry.countryTemperature?.nov as Any,
                            "oct": visaRequirement.destinationCountry.countryTemperature?.oct as Any,
                            "sep": visaRequirement.destinationCountry.countryTemperature?.sep as Any,
                            "updatedAt": (visaRequirement.destinationCountry.countryTemperature != nil ? dateFormatter.string(from: visaRequirement.destinationCountry.countryTemperature!.updatedAt) : nil) as Any
                        ],
                    "travelAdvice":
                        [
                            "advice": visaRequirement.destinationCountry.travelAdvice?.advice as Any,
                            "adviceDate": (visaRequirement.destinationCountry.travelAdvice != nil ? dateFormatter.string(from: visaRequirement.destinationCountry.travelAdvice!.adviceDate) : nil) as Any,
                            "adviceDescription": visaRequirement.destinationCountry.travelAdvice?.adviceDescription.rawValue as Any,
                            "adviceLevel": visaRequirement.destinationCountry.travelAdvice?.adviceLevel as Any,
                            "country": visaRequirement.destinationCountry.travelAdvice?.country as Any,
                            "countryID": visaRequirement.destinationCountry.travelAdvice?.countryID as Any,
                            "createdAt": (visaRequirement.destinationCountry.travelAdvice != nil ? dateFormatter.string(from: visaRequirement.destinationCountry.travelAdvice!.createdAt) : nil) as Any,
                            "detailedAdvice": visaRequirement.destinationCountry.travelAdvice?.detailedAdvice as Any,
                            "id": visaRequirement.destinationCountry.travelAdvice?.id as Any,
                            "updatedAt": (visaRequirement.destinationCountry.travelAdvice != nil ? dateFormatter.string(from: visaRequirement.destinationCountry.travelAdvice!.updatedAt) : nil) as Any,
                            "sourceURL": visaRequirement.destinationCountry.travelAdvice?.sourceURL as Any
                        ],
                    "visaSlug": visaRequirement.destinationCountry.visaSlug as Any,
                    "parentCountryID": visaRequirement.destinationCountry.parentCountryID as Any,
                    "visaSchemeID": visaRequirement.destinationCountry.visaSchemeID as Any,
                    "currencySymbol": visaRequirement.destinationCountry.currencySymbol as Any
                ],
                "visaCategoryID": visaRequirement.visaCategoryID,
                "visaCategory":
                    [
                        "id": visaRequirement.visaCategory.id,
                        "name": visaRequirement.visaCategory.name.rawValue,
                        "visaCategoryDescription": visaRequirement.visaCategory.visaCategoryDescription,
                        "updatedAt": dateFormatter.string(from: visaRequirement.visaCategory.updatedAt) 
                    ],
                "visaSubcategoryID": visaRequirement.visaSubcategoryID,
                "duration": visaRequirement.duration,
                "notes": visaRequirement.notes,
                "totalVotes": visaRequirement.totalVotes,
                "initialVotes": visaRequirement.initialVotes,
                "flightPrice":
                    [
                        "id": visaRequirement.flightPrice?.id as Any,
                        "originCountryID": visaRequirement.flightPrice?.originCountryID as Any,
                        "destinationCountryID": visaRequirement.flightPrice?.destinationCountryID as Any,
                        "minPrice": visaRequirement.flightPrice?.minPrice as Any,
                        "currency": visaRequirement.flightPrice?.currency as Any,
                        "direct": visaRequirement.flightPrice?.direct as Any,
                        "outboundCarrierIDS": visaRequirement.flightPrice?.outboundCarrierIDS as Any,
                        "outboundCarrierNames": visaRequirement.flightPrice?.outboundCarrierNames as Any,
                        "outboundDate": (visaRequirement.flightPrice != nil ? dateFormatter.string(from: visaRequirement.flightPrice!.outboundDate) : nil) as Any,
                        "inboundCarrierIDS": visaRequirement.flightPrice?.inboundCarrierIDS as Any,
                        "inboundCarrierNames": visaRequirement.flightPrice?.inboundCarrierNames as Any,
                        "inboundDate": (visaRequirement.flightPrice != nil ? dateFormatter.string(from: visaRequirement.flightPrice!.inboundDate) : nil) as Any,
                        "quoteDateTime": (visaRequirement.flightPrice != nil ? dateFormatter.string(from: visaRequirement.flightPrice!.quoteDateTime) : nil) as Any
                    ],
                "exchangePrice":
                    [
                        "id": visaRequirement.exchangePrice?.id as Any,
                        "originCountryID": visaRequirement.exchangePrice?.originCountryID as Any,
                        "destinationCountryID": visaRequirement.exchangePrice?.destinationCountryID as Any,
                        "originCurrencyCode": visaRequirement.exchangePrice?.originCurrencyCode as Any,
                        "destinationCurrencyCode": visaRequirement.exchangePrice?.destinationCurrencyCode as Any,
                        "price": visaRequirement.exchangePrice?.price as Any,
                        "quoteDateTime": (visaRequirement.exchangePrice != nil ? dateFormatter.string(from: visaRequirement.exchangePrice!.quoteDateTime) : nil) as Any
                    ],
                "slug": visaRequirement.slug,
                "website": visaRequirement.website,
                "visaName": visaRequirement.visaName,
                "createdAt": dateFormatter.string(from: visaRequirement.createdAt),
                "updatedAt": dateFormatter.string(from: visaRequirement.updatedAt),
                "visaProcessingAvailable": visaRequirement.visaProcessingAvailable as Any
            ])
            
        }
        return encodedVisaRequirements
    }
    
    func decode(data: [[String: Any]]) -> Country {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var visaRequirements = [VisaRequirement]()
        data.forEach { requirement in
            // Region
            var region: Region = .africa
            switch (requirement["destinationCountry"] as! [String: Any])["region"] as! String {
            case "Africa":
                region = .africa
            case "Americas":
                region = .americas
            case "Asia":
                region = .asia
            case "Europe":
                region = .europe
            case "Oceania":
                region = .oceania
            default:
                region = .africa
            }
            
            // developmentStatus
            var developmentStatus: DevelopmentStatus = .developed
            switch (requirement["destinationCountry"] as! [String: Any])["developmentStatus"] as! String {
            case "Developed":
                developmentStatus = .developed
            case "Developing":
                developmentStatus = .developing
            case "Least Developed":
                developmentStatus = .leastDeveloped
            default:
                developmentStatus = .developed
            }
            
            // adviceDescription
            var adviceDescription: AdviceDescription = .doNotTravel
            if let value = (requirement["destinationCountry"] as! [String: Any])["travelAdvice"] as? [String: Any] {
            switch value["adviceDescription"] as! String {
            case "Do not travel":
                adviceDescription = .doNotTravel
            case "Exercise normal safety precautions":
                adviceDescription = .exerciseNormalSafetyPrecautions
            case "High degree of caution":
                adviceDescription = .highDegreeOfCaution
            case "Reconsider your need to travel":
                    adviceDescription = .reconsiderYourNeedToTravel
            default:
                adviceDescription = .doNotTravel
            }
            }
            
            // name
            var name: Name = .eVisa
            switch (requirement["visaCategory"] as! [String: Any])["name"] as! String {
            case "E-visa":
                name = .eVisa
            case "Visa Free":
                name = .visaFree
            case "Visa on Arrival":
                name = .visaOnArrival
            case "Visa Required":
                name = .visaRequired
            default:
                name = .eVisa
            }
            
            visaRequirements.append(VisaRequirement(
                id: requirement["id"] as! Int,
                originCountryID: requirement["originCountryID"] as! Int,
                destinationCountryID: requirement["destinationCountryID"] as! Int, destinationCountry:
                NCountry(
                    id: (requirement["destinationCountry"] as! [String: Any])["id"] as! Int,
                    name: (requirement["destinationCountry"] as! [String: Any])["name"] as! String,
                    alpha2Code: (requirement["destinationCountry"] as! [String: Any])["alpha2Code"] as! String,
                    alpha3Code: (requirement["destinationCountry"] as! [String: Any])["alpha3Code"] as! String,
                    numericCode: (requirement["destinationCountry"] as! [String: Any])["numericCode"] as? String,
                    slug: (requirement["destinationCountry"] as! [String: Any])["slug"] as! String,
                    visaSlug: (requirement["destinationCountry"] as! [String: Any])["visaSlug"] as? String, nationality: (requirement["destinationCountry"] as! [String: Any])["nationality"] as! String,
                    nationalitySlug: (requirement["destinationCountry"] as! [String: Any])["nationalitySlug"] as! String,
                    imageURL: (requirement["destinationCountry"] as! [String: Any])["imageURL"] as! String,
                    capital: (requirement["destinationCountry"] as! [String: Any])["capital"] as? String,
                    isdCode: (requirement["destinationCountry"] as! [String: Any])["isdCode"] as? String,
                    currencyName: (requirement["destinationCountry"] as! [String: Any])["currencyName"] as! String,
                    currencyCode: (requirement["destinationCountry"] as! [String: Any])["currencyCode"] as! String,
                    region: region,
                    subregion: (requirement["destinationCountry"] as! [String: Any])["subregion"] as! String,
                    population: (requirement["destinationCountry"] as! [String: Any])["population"] as! String,
                    lat: (requirement["destinationCountry"] as! [String: Any])["lat"] as! String,
                    lng: (requirement["destinationCountry"] as! [String: Any])["lng"] as! String,
                    city: (requirement["destinationCountry"] as! [String: Any])["city"] as? String,
                    cityLat: (requirement["destinationCountry"] as! [String: Any])["cityLat"] as! String,
                    cityLng: (requirement["destinationCountry"] as! [String: Any])["cityLng"] as! String,
                    area: (requirement["destinationCountry"] as! [String: Any])["area"] as! String,
                    nearbyCountrySlugs: (requirement["destinationCountry"] as! [String: Any])["nearbyCountrySlugs"] as! String,
                    timeZones: (requirement["destinationCountry"] as! [String: Any])["timeZones"] as! String,
                    formalName: (requirement["destinationCountry"] as! [String: Any])["formalName"] as? String,
                    isIndependent: (requirement["destinationCountry"] as! [String: Any])["isIndependent"] as! String,
                    developmentStatus: developmentStatus,
                    languageCodes: (requirement["destinationCountry"] as! [String: Any])["languageCodes"] as! String,
                    languageNames: (requirement["destinationCountry"] as! [String: Any])["languageNames"] as! String,
                    visaProcessingURL: (requirement["destinationCountry"] as! [String: Any])["visaProcessingURL"] as? String,
                    createdAt: dateFormatter.date(from: requirement["createdAt"] as! String)!,
                    updatedAt: dateFormatter.date(from: requirement["updatedAt"] as! String)!,
                    countryTemperature: (requirement["destinationCountry"] as! [String: Any])["countryTemperature"] != nil ? CountryTemperature(
                        id: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["id"] as! Int,
                        countryID: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["countryID"] as! Int,
                        jan: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["jan"] as! Double,
                        feb: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["feb"] as! Double,
                        mar: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["mar"] as! Double,
                        apr: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["apr"] as! Double,
                        may: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["may"] as! Double,
                        jun: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["jun"] as! Double,
                        jul: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["jul"] as! Double,
                        aug: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["aug"] as! Double,
                        sep: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["sep"] as! Double,
                        oct: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["oct"] as! Double,
                        nov: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["nov"] as! Double,
                        dec: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["dec"] as! Double,
                        createdAt: dateFormatter.date(from: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["createdAt"] as! String)!,
                        updatedAt: dateFormatter.date(from: ((requirement["destinationCountry"] as! [String: Any])["countryTemperature"] as! [String: Any])["updatedAt"] as! String)!
                        ) : nil,
                    travelAdvice: (requirement["destinationCountry"] as! [String: Any])["travelAdvice"] != nil ? TravelAdvice(
                        id: ((requirement["destinationCountry"] as! [String: Any])["travelAdvice"] as! [String: Any])["id"] as! Int,
                        countryID: ((requirement["destinationCountry"] as! [String: Any])["travelAdvice"] as! [String: Any])["countryID"] as! Int,
                        adviceLevel: ((requirement["destinationCountry"] as! [String: Any])["travelAdvice"] as! [String: Any])["adviceLevel"] as! Int,
                        adviceDate: dateFormatter.date(from: ((requirement["destinationCountry"] as! [String: Any])["travelAdvice"] as! [String: Any])["adviceDate"] as! String)!,
                        advice: ((requirement["destinationCountry"] as! [String: Any])["travelAdvice"] as! [String: Any])["advice"] as! String,
                        adviceDescription: adviceDescription,
                        detailedAdvice: ((requirement["destinationCountry"] as! [String: Any])["travelAdvice"] as! [String: Any])["detailedAdvice"] as! String,
                        sourceURL: ((requirement["destinationCountry"] as! [String: Any])["travelAdvice"] as! [String: Any])["sourceURL"] as! String,
                        createdAt: dateFormatter.date(from: ((requirement["destinationCountry"] as! [String: Any])["travelAdvice"] as! [String: Any])["createdAt"] as! String)!,
                        updatedAt: dateFormatter.date(from: ((requirement["destinationCountry"] as! [String: Any])["travelAdvice"] as! [String: Any])["updatedAt"] as! String)!
                        ) : nil,
                    visaSchemeID: (requirement["destinationCountry"] as! [String: Any])["visaSchemeID"] as? Int,
                    parentCountryID: (requirement["destinationCountry"] as! [String: Any])["parentCountryID"] as? Int,
                    currencySymbol: (requirement["destinationCountry"] as! [String: Any])["currencySymbol"] as? String
                ),
                visaCategoryID: requirement["visaCategoryID"] as! Int, visaCategory: VisaCategory(
                    id: (requirement["visaCategory"] as! [String: Any])["id"] as! Int,
                    name: name,
                    visaCategoryDescription: (requirement["visaCategory"] as! [String: Any])["visaCategoryDescription"] as! String,
                    updatedAt: dateFormatter.date(from: (requirement["visaCategory"] as! [String: Any])["updatedAt"] as! String)!
                ),
                visaSubcategoryID: requirement["visaSubcategoryID"] as! Int,
                duration: requirement["duration"] as! String,
                notes: requirement["notes"] as! String,
                totalVotes: requirement["totalVotes"] as! Int,
                initialVotes: requirement["initialVotes"] as! Int,
                exchangePrice: requirement["exchangePrice"] != nil ?
                    ExchangePrice(
                        id: (requirement["exchangePrice"] as! [String: Any])["id"] as! Int,
                        originCountryID: (requirement["exchangePrice"] as! [String: Any])["originCountryID"] as! Int,
                        destinationCountryID: (requirement["exchangePrice"] as! [String: Any])["destinationCountryID"] as! Int,
                        originCurrencyCode: ((requirement["exchangePrice"] as! [String: Any])["originCurrencyCode"] as! String),
                        destinationCurrencyCode: (requirement["exchangePrice"] as! [String: Any])["destinationCurrencyCode"] as! String,
                        price: (requirement["exchangePrice"] as! [String: Any])["price"] as! Double,
                        quoteDateTime: dateFormatter.date(from: (requirement["exchangePrice"] as! [String: Any])["quoteDateTime"] as! String)!
                    ) : nil,
                slug: requirement["slug"] as! String,
                website: requirement["website"] as! String,
                visaName: requirement["visaName"] as! String,
                createdAt: dateFormatter.date(from: requirement["createdAt"] as! String)!,
                updatedAt: dateFormatter.date(from: requirement["updatedAt"] as! String)!,
                flightPrice: requirement["flightPrice"] != nil ? FlightPrice(
                    id: (requirement["flightPrice"] as! [String: Any])["id"] as! Int,
                    originCountryID: (requirement["flightPrice"] as! [String: Any])["originCountryID"] as! Int,
                    destinationCountryID: (requirement["flightPrice"] as! [String: Any])["destinationCountryID"] as! Int,
                    minPrice: (requirement["flightPrice"] as! [String: Any])["minPrice"] as! Int,
                    currency: ((requirement["flightPrice"] as! [String: Any])["currency"] as! String),
                    direct: (requirement["flightPrice"] as! [String: Any])["direct"] as! Int,
                    outboundCarrierIDS: (requirement["flightPrice"] as! [String: Any])["outboundCarrierIDS"] as! String,
                    outboundCarrierNames: (requirement["flightPrice"] as! [String: Any])["outboundCarrierNames"] as! String,
                    outboundDate: dateFormatter.date(from: (requirement["flightPrice"] as! [String: Any])["outboundDate"] as! String)!,
                    inboundCarrierIDS: (requirement["flightPrice"] as! [String: Any])["inboundCarrierIDS"] as! String,
                    inboundCarrierNames: (requirement["flightPrice"] as! [String: Any])["inboundCarrierNames"] as! String,
                    inboundDate: dateFormatter.date(from: (requirement["flightPrice"] as! [String: Any])["inboundDate"] as! String)!,
                    quoteDateTime: dateFormatter.date(from: (requirement["flightPrice"] as! [String: Any])["quoteDateTime"] as! String)!
                ) : nil,
                visaProcessingAvailable: requirement["visaProcessingAvailable"] as? Int)
            )
        }
        return Country(visaRequirements: visaRequirements)
        
    }
}
