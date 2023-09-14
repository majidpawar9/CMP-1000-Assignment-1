//
//  YugiohAPI_Helper.swift
//  Assignment_1
//
//  Created by Majid Pawar on 2023-09-13.
//

import Foundation

enum DigimonAPI_Errors: Error {
    case CANNOT_PARSE_DATA_INTO_JSON
    case CANNOT_CONVERT_STRING_TO_URL
}

class DigimonAPI_Helper{
    static private let baseURL_String = "https://digimon-api.vercel.app/api/digimon"
    
    static public func fetch() async throws -> Any{
        guard
            let url = URL(string: baseURL_String)
        else {throw DigimonAPI_Errors.CANNOT_CONVERT_STRING_TO_URL}
        
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let jsonObject = try JSONSerialization.jsonObject(with: data)
        
            return jsonObject
        } catch {
            throw error
        }
    }
}
