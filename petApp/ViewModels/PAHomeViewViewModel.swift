//
//  PAHomeViewViewModel.swift
//  petApp
//
//  Created by Talha Demirkan on 2.01.2024.
//

import Foundation

final class PAHomeViewViewModel{
    
    enum SectionType: CaseIterable {
        case header
        case main
    }
    
    public let sections = SectionType.allCases
}
