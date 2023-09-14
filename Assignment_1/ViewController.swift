//
//  ViewController.swift
//  Assignment_1
//
//  Created by Majid Pawar on 2023-09-13.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func callDotaAPI(_ sender: Any) {
        Task {
              do{
                await print( try DotaAPI_Helper.fetch())
                    } catch DotaAPI_Errors.CANNOT_CONVERT_STRING_TO_URL {
                        print("Please insert connect url")
                    } catch {
                        print(error)
                    }
                }
    }
    @IBAction func callDigimonAPI(_ sender: Any) {
        Task {
              do{
                await print( try DigimonAPI_Helper.fetch())
                    } catch DigimonAPI_Errors.CANNOT_CONVERT_STRING_TO_URL {
                        print("Please insert connect url")
                    } catch {
                        print(error)
                    }
                }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

