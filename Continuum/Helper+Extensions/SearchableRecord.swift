//
//  SearchableRecord.swift
//  Continuum
//
//  Created by Deven Day on 10/7/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matches(searchTerm: String) -> Bool
}
