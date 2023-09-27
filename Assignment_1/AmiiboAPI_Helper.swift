//
//  AmiiboAPI_Helper.swift
//  Assignment_1
//
//  Created by Majid Pawar on 2023-09-13.
//

import Foundation

// Define custom errors for the Amiibo API helper.
enum AmiiboAPI_Errors: Error {
    case CANNOT_PARSE_DATA_INTO_JSON
    case CANNOT_CONVERT_STRING_TO_URL
}

class AmiiboAPI_Helper{
    // Define the base URL for the Amiibo API.
    static private let baseURL_String = "https://www.amiiboapi.com/api/amiibo/"
    
    // Function for fetching data from the Amiibo API asynchronously.
    static public func fetch() async throws -> Any{
        // Convert the base URL string into a URL object.
        guard
            let url = URL(string: baseURL_String)
        else {throw AmiiboAPI_Errors.CANNOT_CONVERT_STRING_TO_URL}
        
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
