//
//  Constants.swift
//  Time Lab
//
//  Created by Pranav Karnani on 25/10/18.
//  Copyright © 2018 Tushar Singh. All rights reserved.
//

import Foundation

let selectedLang = "en"
let aboutus_url = "https://www.timelabkw.com/wp-json/wp/v2/pages/?lang=LANG_CODE&slug=post-ad&fields=id,title.rendered,content.rendered"
let contactus_url = "https://www.timelabkw.com/wp-json/wp/v2/pages/?lang=LANG_CODE&slug=contact-us&fields=id,title.rendered,content.rendered"
let ad_url = "https://www.timelabkw.com/wp-json/wp/v2/pages/?lang=LANG_CODE&slug=post-ad&fields=id,title.rendered,content.rendered"
let tandc_url = "https://www.timelabkw.com/wp-json/wp/v2/pages/?lang=LANG_CODE&slug=terms-and-conditions&fields=id,title.rendered,content.rendered"
let brands_url = "https://www.timelabkw.com/wp-json/wc/v2/products/categories"
let watches_url = "https://www.timelabkw.com/wp-json/wc/v2/products?per_page=15&category=CATEGORY_ID&orderby=id"

let authKey = "Basic Y2tfYzU4MDIyMmU5MzBjZmUyMDg3ZDE2Y2I0ODhjZjM0ZjFkMDczZjJjOQo6Y3NfY2Y5MDY0Mzc5ZTI4NThmNDFjOTllMmI0MmQ5OTgxYjFhYjRhNTkwMw=="

struct Details : Decodable {
    var id: String
    var title: DetailContent
    var content: DetailContent
}

struct DetailContent : Decodable {
    var rendered: String
}

struct Watches: Decodable {
    var id : Int
    var name : String
    var slug : String
    var description : String
    var image : ImageDetails
    var menu_order : Int
    var count : Int
}

struct ImageDetails: Decodable {
    var src: String
    var title : String
}

struct WatchDetails : Decodable {
    var id : Int
    var name : String
    var slug : String
    var in_stock : Bool
    var price : Int
}
