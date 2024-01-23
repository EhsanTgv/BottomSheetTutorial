//
//  BottomSheetUIView.swift
//  BottomSheetTutorial
//
//  Created by Ehsan Taghavi on 23.01.2024.
//

import UIKit

class BottomSheetUIView: UIView{
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Bottom Sheet"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    required init?(coder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy(){
        self.addSubview(mainLabel)
    }
    
    func setupViewAttributes(){
        self.backgroundColor = .black
        self.layer.cornerRadius = 40
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50)
        ])
    }
}
