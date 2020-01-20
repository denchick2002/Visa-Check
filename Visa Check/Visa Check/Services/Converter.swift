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
            // Subregion
            var subregion: Subregion = .australiaAndNewZealand
            switch (requirement["destinationCountry"] as! [String: Any])["subregion"] as! String {
            case "Australia and New Zealand":
                subregion = .australiaAndNewZealand
            case "Caribbean":
                subregion = .caribbean
            case "Central America":
                subregion = .centralAmerica
            case "Central Asia":
                subregion = .centralAsia
            case "Central Europe":
                subregion = .centralEurope
            case "Eastern Africa":
                subregion = .easternAfrica
            case "Eastern Asia":
                subregion = .easternAsia
            case "Eastern Europe":
                subregion = .easternEurope
            case "Melanesia":
                subregion = .melanesia
            case "Micronesia":
                subregion = .micronesia
            case "Middle Africa":
                subregion = .middleAfrica
            case "Middle East":
                subregion = .middleEast
            case "Northern Africa":
                subregion = .northernAfrica
            case "Northern America":
                subregion = .northernAmerica
            case "Northern Europe":
                subregion = .northernEurope
            case "Polynesia":
                subregion = .polynesia
            case "South America":
                subregion = .southAmerica
            case "South-Eastern Asia":
                subregion = .southEasternAsia
            case "Southern Africa":
                subregion = .southernAfrica
            case "Southern Asia":
                subregion = .southernAsia
            case "Southern Europe":
                subregion = .southernEurope
            case "Western Africa":
                subregion = .westernAfrica
            case "Western Asia":
                subregion = .westernAsia
            case "Western Europe":
                subregion = .westernEurope
            default:
                subregion = .australiaAndNewZealand
            }
            
            // isIndependent
            var isIndependent: IsIndependent = .associatedWithNewZealand
            switch (requirement["destinationCountry"] as! [String: Any])["isIndependent"] as! String {
            case "Associated with New Zealand":
                isIndependent = .associatedWithNewZealand
            case "Commonwealth of US":
                isIndependent = .commonwealthOfUS
            case "Crown dependency of UK":
                isIndependent = .crownDependencyOfUK
            case "In contention":
                isIndependent = .inContention
            case "Part of China":
                isIndependent = .partOfChina
            case "Part of Denmark":
                isIndependent = .partOfDenmark
            case "Part of Finland":
                isIndependent = .partOfFinland
            case "Part of France":
                isIndependent = .partOfFrance
            case "Part of Netherlands":
                isIndependent = .partOfNetherlands
            case "Territory of Australia":
                isIndependent = .territoryOfAustralia
            case "Territory of France":
                isIndependent = .territoryOfFrance
            case "Territory of Norway":
                isIndependent = .territoryOfNorway
            case "Territory of UK":
                isIndependent = .territoryOfUK
            case "Territory of US":
                isIndependent = .territoryOfUS
            case "Yes":
                isIndependent = .yes
            default:
                isIndependent = .associatedWithNewZealand
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
            
            // visa name
            var visaName: VisaName = .e600OnlineVisitorVisa
            switch requirement["visaName"] as! String {
            case "e600 Online Visitor Visa":
                visaName = .e600OnlineVisitorVisa
            case "eVisa":
                visaName = .eVisa
            case "eVisa / Free visa on arrival":
                visaName = .eVisaFreeVisaOnArrival
            case "eVisa / Visa on arrival":
                visaName = .eVisaVisaOnArrival
            case "Electronic Authorization":
                visaName = .electronicAuthorization
            case "Electronic visa":
                visaName = .electronicVisa
            case "Entry Permit on arrival":
                visaName = .entryPermitOnArrival
            case "Entry permit required":
                visaName = .entryPermitRequired
            case "Online Visa":
                visaName = .onlineVisa
            case "Permit required":
                visaName = .permitRequired
            case "Special permit required":
                visaName = .specialPermitRequired
            case "Tourist card required":
                visaName = .touristCardRequired
            case "e-Visa":
                visaName = .visaNameEVisa
            case "Visa not required":
                visaName = .visaNotRequired
            case "Visa on arrival":
                visaName = .visaOnArrival
            case "Visa required":
                visaName = .visaRequired
            case "Visitor's Permit on arrival":
                visaName = .visitorSPermitOnArrival
            default:
                visaName = .e600OnlineVisitorVisa
            }
            
            // duration
            var duration: Duration = .empty
            switch (requirement["duration"] as! String) {
            case "":
                duration = .empty
            case "14 days":
                duration = .the14Days
            case "14 days/ 1 month":
                duration = .the14Days1Month
            case "15 days":
                duration = .the15Days
            case "180 days":
                duration = .the180Days
            case "183 days":
                duration = .the183Days
            case "1 month":
                duration = .the1Month
            case "1 year":
                duration = .the1Year
            case "21 days":
                duration = .the21Days
            case "28 days":
                duration = .the28Days
            case "2 months":
                duration = .the2Months
            case "30 days":
                duration = .the30Days
            case "30 days / 8 days":
                duration = .the30Days8Days
            case "31 days":
                duration = .the31Days
            case "360 days":
                duration = .the360Days
            case "3 months":
                duration = .the3Months
            case "45 days":
                duration = .the45Days
            case "4 months":
                duration = .the4Months
            case "60 days":
                duration = .the60Days
            case "6 weeks":
                duration = .the6Weeks
            case "7 days":
                duration = .the7Days
            case "90 days":
                duration = .the90Days
            case "Unlimited stay":
                duration = .unlimitedStay
            case "up to 90 days":
                duration = .upTo90Days
            default:
                duration = .empty
            }
            
            
            // origin currency code
            var originCurrencyCode: OriginCurrencyCode? = nil
            if let value = requirement["flightPrice"] as? [String: Any], let code = value["currency"] as? String {
                switch code {
                case "BYN":
                    originCurrencyCode = .byn
                case "RUB":
                    originCurrencyCode = .rub
                case "UAH":
                    originCurrencyCode = .uah
                default:
                    originCurrencyCode = nil
                }
            }
            
            if let value = requirement["exchangePrice"] as? [String: Any], let code = value["originCurrencyCode"] as? String {
                switch code {
                case "BYN":
                    originCurrencyCode = .byn
                case "RUB":
                    originCurrencyCode = .rub
                case "UAH":
                    originCurrencyCode = .uah
                default:
                    originCurrencyCode = originCurrencyCode != nil ? originCurrencyCode : nil
                }
            }
            
            visaRequirements.append(VisaRequirement(
                id: requirement["id"] as! Int,
                originCountryID: requirement["originCountryID"] as! Int,
                destinationCountryID: requirement["destinationCountryID"] as! Int,
                destinationCountry: NCountry(
                    id: (requirement["destinationCountry"] as! [String: Any])["id"] as! Int,
                    name: (requirement["destinationCountry"] as! [String: Any])["name"] as! String,
                    alpha2Code: (requirement["destinationCountry"] as! [String: Any])["alpha2Code"] as! String,
                    alpha3Code: (requirement["destinationCountry"] as! [String: Any])["alpha3Code"] as! String,
                    numericCode: (requirement["destinationCountry"] as! [String: Any])["numericCode"] as? String,
                    slug: (requirement["destinationCountry"] as! [String: Any])["slug"] as! String,
                    nationality: (requirement["destinationCountry"] as! [String: Any])["nationality"] as! String,
                    nationalitySlug: (requirement["destinationCountry"] as! [String: Any])["nationalitySlug"] as! String,
                    imageURL: (requirement["destinationCountry"] as! [String: Any])["imageURL"] as! String,
                    capital: (requirement["destinationCountry"] as! [String: Any])["capital"] as? String,
                    isdCode: (requirement["destinationCountry"] as! [String: Any])["isdCode"] as? String,
                    currencyName: (requirement["destinationCountry"] as! [String: Any])["currencyName"] as! String,
                    currencyCode: (requirement["destinationCountry"] as! [String: Any])["currencyCode"] as! String,
                    region: region,
                    subregion: subregion,
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
                    isIndependent: isIndependent,
                    developmentStatus: developmentStatus,
                    languageCodes: (requirement["destinationCountry"] as! [String: Any])["languageCodes"] as! String,
                    languageNames: (requirement["destinationCountry"] as! [String: Any])["languageNames"] as! String,
                    countryVisaRanking: (requirement["destinationCountry"] as! [String: Any])["countryVisaRanking"] != nil ? CountryVisaRanking(
                        countryID: ((requirement["destinationCountry"] as! [String: Any])["countryVisaRanking"] as! [String: Any])["countryID"] as! Int,
                        visaFree: ((requirement["destinationCountry"] as! [String: Any])["countryVisaRanking"] as! [String: Any])["visaFree"] as! Int,
                        visaOnArrival: ((requirement["destinationCountry"] as! [String: Any])["countryVisaRanking"] as! [String: Any])["visaOnArrival"] as! Int,
                        eVisa: ((requirement["destinationCountry"] as! [String: Any])["countryVisaRanking"] as! [String: Any])["eVisa"] as! Int,
                        visaRequired: ((requirement["destinationCountry"] as! [String: Any])["countryVisaRanking"] as! [String: Any])["visaRequired"] as! Int,
                        visaRefused: ((requirement["destinationCountry"] as! [String: Any])["countryVisaRanking"] as! [String: Any])["visaRefused"] as! Int,
                        visaUnknown: ((requirement["destinationCountry"] as! [String: Any])["countryVisaRanking"] as! [String: Any])["visaUnknown"] as! Int,
                        visaEasyTotal: ((requirement["destinationCountry"] as! [String: Any])["countryVisaRanking"] as! [String: Any])["visaEasyTotal"] as! Int
                        ) : nil ,
                    visaProcessingURL: (requirement["destinationCountry"] as! [String: Any])["visaProcessingURL"] as? String, createdAt: dateFormatter.date(from: requirement["createdAt"] as! String)!,
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
                    visaSlug: (requirement["destinationCountry"] as! [String: Any])["visaSlug"] as? String,
                    visaSchemeID: (requirement["destinationCountry"] as! [String: Any])["visaSchemeID"] as? Int, parentCountryID: (requirement["destinationCountry"] as! [String: Any])["parentCountryID"] as? Int,
                    currencySymbol: (requirement["destinationCountry"] as! [String: Any])["currencySymbol"] as? String
            ),
                visaCategoryID: requirement["visaCategoryID"] as! Int,
                visaCategory: VisaCategory(
                    id: (requirement["visaCategory"] as! [String: Any])["id"] as! Int,
                    name: name,
                    visaCategoryDescription: (requirement["visaCategory"] as! [String: Any])["visaCategoryDescription"] as! String,
                    updatedAt: dateFormatter.date(from: (requirement["visaCategory"] as! [String: Any])["updatedAt"] as! String)!
                ),
                visaSubcategoryID: requirement["visaSubcategoryID"] as! Int,
                duration: duration,
                notes: requirement["notes"] as! String,
                totalVotes: requirement["totalVotes"] as! Int,
                initialVotes: requirement["initialVotes"] as! Int,
                flightPrice: requirement["flightPrice"] != nil ?
                    FlightPrice(
                        id: (requirement["flightPrice"] as! [String: Any])["id"] as! Int,
                        originCountryID: (requirement["flightPrice"] as! [String: Any])["originCountryID"] as! Int,
                        destinationCountryID: (requirement["flightPrice"] as! [String: Any])["destinationCountryID"] as! Int,
                        minPrice: (requirement["flightPrice"] as! [String: Any])["minPrice"] as! Int,
                        currency: originCurrencyCode!,
                        direct: (requirement["flightPrice"] as! [String: Any])["direct"] as! Int,
                        outboundCarrierIDS: (requirement["flightPrice"] as! [String: Any])["outboundCarrierIDS"] as! String,
                        outboundCarrierNames: (requirement["flightPrice"] as! [String: Any])["outboundCarrierNames"] as! String,
                        outboundDate: dateFormatter.date(from: (requirement["flightPrice"] as! [String: Any])["outboundDate"] as! String)!,
                        inboundCarrierIDS: (requirement["flightPrice"] as! [String: Any])["inboundCarrierIDS"] as! String,
                        inboundCarrierNames: (requirement["flightPrice"] as! [String: Any])["inboundCarrierNames"] as! String,
                        inboundDate: dateFormatter.date(from: (requirement["flightPrice"] as! [String: Any])["inboundDate"] as! String)!,
                        quoteDateTime: dateFormatter.date(from: (requirement["flightPrice"] as! [String: Any])["quoteDateTime"] as! String)!
                    ) : nil,
                exchangePrice: requirement["exchangePrice"] != nil ?
                ExchangePrice(
                    id: (requirement["exchangePrice"] as! [String: Any])["id"] as! Int,
                    originCountryID: (requirement["exchangePrice"] as! [String: Any])["originCountryID"] as! Int,
                    destinationCountryID: (requirement["exchangePrice"] as! [String: Any])["destinationCountryID"] as! Int,
                    originCurrencyCode: originCurrencyCode!,
                    destinationCurrencyCode: (requirement["exchangePrice"] as! [String: Any])["destinationCurrencyCode"] as! String,
                    price: (requirement["exchangePrice"] as! [String: Any])["price"] as! Double,
                    quoteDateTime: dateFormatter.date(from: (requirement["exchangePrice"] as! [String: Any])["quoteDateTime"] as! String)!
                    ) : nil,
                slug: requirement["slug"] as! String,
                website: requirement["website"] as! String,
                visaName: visaName,
                createdAt: dateFormatter.date(from: requirement["createdAt"] as! String)!,
                updatedAt: dateFormatter.date(from: requirement["updatedAt"] as! String)!,
                visaProcessingAvailable: requirement["visaProcessingAvailable"] as? Int)
            )
        }
        return Country(visaRequirements: visaRequirements)
        
    }
}



