//
//  DollarYen.swift
//  DemoProject
//
//  Created by kazunori.aoki on 2022/10/28.
//

import Foundation

struct DollarYen: Identifiable {
    var id: String = UUID().uuidString
    var date: String
    var yen: Double
    var isAnimate: Bool = false
}

var sampleRate: [DollarYen] = [
    .init(date: "2000", yen: 107.7655),
    .init(date: "2001", yen: 121.5289),
    .init(date: "2002", yen: 125.3880),
    .init(date: "2003", yen: 115.9335),
    .init(date: "2004", yen: 108.1926),
    .init(date: "2005", yen: 110.2182),
    .init(date: "2006", yen: 116.2993),
    .init(date: "2007", yen: 117.7535),
    .init(date: "2008", yen: 103.3595),
    .init(date: "2009", yen: 93.5701),
    .init(date: "2010", yen: 87.7799),
    .init(date: "2011", yen: 79.8070),
    .init(date: "2012", yen: 79.7905),
    .init(date: "2013", yen: 97.5957),
    .init(date: "2014", yen: 105.9448),
    .init(date: "2015", yen: 121.0440),
    .init(date: "2016", yen: 108.7929),
    .init(date: "2017", yen: 112.1661),
    .init(date: "2018", yen: 110.4232),
    .init(date: "2019", yen: 109.0097),
    .init(date: "2020", yen: 106.7746),
    .init(date: "2021", yen: 109.7543),
    .init(date: "2022", yen: 128.0801),
]
