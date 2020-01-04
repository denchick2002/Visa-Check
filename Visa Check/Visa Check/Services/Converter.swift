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
                    "subregion": visaRequirement.destinationCountry.subregion.rawValue,
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
                    "isIndependent": visaRequirement.destinationCountry.isIndependent.rawValue,
                    "developmentStatus": visaRequirement.destinationCountry.developmentStatus.rawValue,
                    "languageCodes": visaRequirement.destinationCountry.languageCodes,
                    "languageNames": visaRequirement.destinationCountry.languageNames,
                    "countryVisaRanking":
                        [
                                "countryID": visaRequirement.destinationCountry.countryVisaRanking?.countryID,
                                "eVisa": visaRequirement.destinationCountry.countryVisaRanking?.eVisa,
                                "visaEasyTotal": visaRequirement.destinationCountry.countryVisaRanking?.visaEasyTotal,
                                "visaFree": visaRequirement.destinationCountry.countryVisaRanking?.visaFree,
                                "visaOnArrival": visaRequirement.destinationCountry.countryVisaRanking?.visaOnArrival,
                                "visaRefused": visaRequirement.destinationCountry.countryVisaRanking?.visaRefused,
                                "visaRequired": visaRequirement.destinationCountry.countryVisaRanking?.visaRequired,
                                "visaUnknown": visaRequirement.destinationCountry.countryVisaRanking?.visaUnknown
                        ],
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
                "duration": visaRequirement.duration.rawValue,
                "notes": visaRequirement.notes,
                "totalVotes": visaRequirement.totalVotes,
                "initialVotes": visaRequirement.initialVotes,
                "flightPrice":
                    [
                        "id": visaRequirement.flightPrice?.id as Any,
                        "originCountryID": visaRequirement.flightPrice?.originCountryID as Any,
                        "destinationCountryID": visaRequirement.flightPrice?.destinationCountryID as Any,
                        "minPrice": visaRequirement.flightPrice?.minPrice as Any,
                        "currency": visaRequirement.flightPrice?.currency.rawValue as Any,
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
                        "originCurrencyCode": visaRequirement.exchangePrice?.originCurrencyCode.rawValue as Any,
                        "destinationCurrencyCode": visaRequirement.exchangePrice?.destinationCurrencyCode as Any,
                        "price": visaRequirement.exchangePrice?.price as Any,
                        "quoteDateTime": (visaRequirement.exchangePrice != nil ? dateFormatter.string(from: visaRequirement.exchangePrice!.quoteDateTime) : nil) as Any
                    ],
                "slug": visaRequirement.slug,
                "website": visaRequirement.website,
                "visaName": visaRequirement.visaName.rawValue,
                "createdAt": dateFormatter.string(from: visaRequirement.createdAt),
                "updatedAt": dateFormatter.string(from: visaRequirement.updatedAt),
                "visaProcessingAvailable": visaRequirement.visaProcessingAvailable as Any
            ])
            
        }
        return encodedVisaRequirements
    }
    
    
}
