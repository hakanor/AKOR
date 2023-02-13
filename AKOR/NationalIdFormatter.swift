//
//  NationalIdFormatter.swift
//  AKOR
//
//  Created by Hakan Or on 13.02.2023.
//

final class NationalIdFormatter {
    public func format(text: String) -> String {
        if text.count > 11 {
            return String(text.prefix(11))
        }
        return text
    }
}
