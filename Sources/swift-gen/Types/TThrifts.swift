//
//  TThrifts.swift
//  swift-gen
//
//  Created by Arror on 2019/5/26.
//

import Foundation

public struct TThrifts: Decodable {
    
    public let input: String
    public let clientOutput: String
    public let serverOutput: String
    public let thrifts: [String: TThrift]
    public let version: String
    public let clientNamespcae: String
    public let serverNamespace: String
    
    private enum CodingKeys: String, CodingKey {
        case input              = "IP"
        case clientOutput       = "COP"
        case serverOutput       = "SOP"
        case thrifts            = "TS"
        case version            = "TV"
        case clientNamespcae    = "CNS"
        case serverNamespace    = "SNS"
    }
}
