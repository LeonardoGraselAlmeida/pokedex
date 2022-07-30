//
//  NetworkResult.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 30/07/22.
//

import Foundation

typealias NetworkResult<T: Decodable> = ((Result<T, Error>) -> Void)
