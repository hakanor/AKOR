//
//  NationalIdFormatter.swift
//  AKOR
//
//  Created by Hakan Or on 13.02.2023.
//

import Foundation

final class NationalIdFormatter {
    public func format(text: String) -> String {
        if text.count > 11 {
            return String(text.prefix(11))
        } else if Int(text) == nil {
            let numericSet = "0123456789"
            let filteredCharacters = text.filter {
                return numericSet.contains(String($0))
            }
            return String(filteredCharacters)
        }
        return text
    }
}
