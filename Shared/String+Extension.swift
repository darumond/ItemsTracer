//
//  String+Extension.swift
//  ItemsTracer
//
//  Created by Luc Nguyen on 31/01/2024.
//

import Foundation

extension String: Error, LocalizedError{
    public var errorDescription: String? {self}
}
