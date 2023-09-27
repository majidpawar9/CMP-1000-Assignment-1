//
//  ViewController.swift
//  Assignment_1
//
//  Created by Majid Pawar on 2023-09-13.
//

import UIKit

class ViewController: UIViewController {

    // Function to call the Dota API when a button is pressed.
    @IBAction func callDotaAPI(_ sender: Any) {
        Task {
              do{
                // Call the Dota API helper function and print the result.
                await print( try DotaAPI_Helper.fetch())
                    } catch DotaAPI_Errors.CANNOT_CONVERT_STRING_TO_URL {
                        // Handle the error if URL conversion fails.
                        print("Please insert connect url")
                    } catch {
                        // Handle other errors.
                        print(error)
                    }
                }
    }
    // Function to call the Digimon API when a button is pressed.
    @IBAction func callDigimonAPI(_ sender: Any) {
        Task {
              do{
                // Call the Digimon API helper function and print the result.
                await print( try DigimonAPI_Helper.fetch())
                    } catch DigimonAPI_Errors.CANNOT_CONVERT_STRING_TO_URL {
                        // Handle the error if URL conversion fails.
                        print("Please insert connect url")
                    } catch {
                        // Handle other errors.
                        print(error)
                    }
                }
    }
    // Function to call the Amiibo API when a button is pressed.
    @IBAction func callAmiiboAPI(_ sender: Any) {
        Task {
              do{
                // Call the Amiibo API helper function and print the result.
                await print( try AmiiboAPI_Helper.fetch())
                    } catch AmiiboAPI_Errors.CANNOT_CONVERT_STRING_TO_URL {
                        // Handle the error if URL conversion fails.
                        print("Please insert connect url")
                    } catch {
                        // Handle other errors.
                        print(error)
                    }
                }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

