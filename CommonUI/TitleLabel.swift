//
//  TitleLabel.swift
//  CommonUI
//
//  Created by Егор Бадмаев on 08.11.2022.
//

import UIKit
import Resources

public final class TitleLabel: UILabel {
    
    // MARK: - Init
    
    public init(text: String = "") {
        super.init(frame: .zero)
        self.text = text
        
        font = Fonts.headline()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
