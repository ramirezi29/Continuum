//
//  SearchableRecord.swift
//  Continuum
//
//  Created by Ivan Ramirez on 9/26/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    
    func matches(searchTerm: String) -> Bool
}
