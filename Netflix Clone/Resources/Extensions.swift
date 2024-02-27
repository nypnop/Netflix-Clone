//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 29/02/24.
//

import Foundation

extension String {
    func capitalizedFirstChar() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
