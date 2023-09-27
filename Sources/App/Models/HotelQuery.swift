//
//  File.swift
//  
//
//  Created by shikhar on 27/09/23.
//

import Foundation
import Vapor

struct HotelQuery: Content{
    let sort: String
    let search: String
}
