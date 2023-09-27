//
//  DotaAPI_Helper.swift
//  Assignment_1
//
//  Created by Majid Pawar on 2023-09-13.
//

import Foundation

// Define custom errors for the Dota API helper.
enum DotaAPI_Errors: Error {
    case CANNOT_PARSE_DATA_INTO_JSON
    case CANNOT_CONVERT_STRING_TO_URL
}

class DotaAPI_Helper{
    // Define the base URL for the Dota API.
    static private let baseURL_String = "https://api.opendota.com/api/"
    // Function for fetching data from the Dota API asynchronously.
    static public func fetch() async throws -> Any{
        // Convert the base URL string into a URL object.
        guard
            let url = URL(string: baseURL_String)
        else {throw DotaAPI_Errors.CANNOT_CONVERT_STRING_TO_URL}
        
        do{
            // Perform an asynchronous data fetch from the URL.
            let (data, _) = try await URLSession.shared.data(from: url)
            // Parse the fetched data into a JSON object.
            let jsonObject = try JSONSerialization.jsonObject(with: data)
            // Return the parsed JSON object.
            return jsonObject
        } catch {
            // If any errors occur during the fetch or JSON parsing, rethrow the error.
            throw error
        }
    }
}
