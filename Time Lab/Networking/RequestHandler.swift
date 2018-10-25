//
//  RequestHandler.swift
//  Time Lab
//
//  Created by Pranav Karnani on 25/10/18.
//  Copyright © 2018 Tushar Singh. All rights reserved.
//

import Foundation

var requested_data : [Details] = []
var categories : [Watches] = []
var brands_id : [Int] = []
var watches : [String:[WatchDetails]] = [:]


class RequestHandler {
    
    static let shared : RequestHandler = RequestHandler()
    
    func getDetails(type: String,completion : @escaping (Int) -> ()) {
        var url = ""
        switch  type {
        case "About Us":
            url = aboutus_url
            break
        case "Post Ad":
            url = ad_url
            break
        case "Contact Us":
            url = contactus_url
            break
        case "Terms":
            url = tandc_url
            break
        default:
            url = aboutus_url
            break
        }
        
        URLSession.shared.dataTask(with: URL(string: url.replacingOccurrences(of: "LANG_CODE", with: selectedLang))!) { (data, response, error) in
            if(error != nil) {
                print(error)
                completion(1)
            }
            else {
                guard let data = data else { return }
                do {
                    requested_data = try JSONDecoder().decode([Details].self, from: data)
                    completion(0)
                }catch {
                    print("\(error.localizedDescription)")
                    completion(1)
                }
            }
        }.resume()
    }
    
    func getBrands(completion: @escaping(Int) -> ()) {
        var request = URLRequest(url: URL(string: brands_url)!)
        request.addValue(authKey, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if(error != nil) {
                completion(0)
            }
            else {
                guard let data = data else { return }
                do {
                    categories = try JSONDecoder().decode([Watches].self, from: data)
                    completion(1)
                } catch {
                    print("error")
                    completion(0)
                }
            }
        }.resume()
        
    }
    
    func getWatch(category: Int,completion : @escaping(Int) -> ()) {
        
        let url = watches_url.replacingOccurrences(of: "CATEGORY_ID", with: String(category))
        var request = URLRequest(url: URL(string: url)!)
        request.addValue(authKey, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if(error != nil) {
                print("error")
                completion(0)
            }
            else {
                guard let data = data else { return }
                do {
                    watches[String(category)] = try JSONDecoder().decode([WatchDetails].self, from: data)
                    completion(1)
                } catch {
                    print("error")
                    completion(0)
                }
            }
        }.resume()
    }
}
