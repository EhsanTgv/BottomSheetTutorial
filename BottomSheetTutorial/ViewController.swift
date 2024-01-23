//
//  ViewController.swift
//  BottomSheetTutorial
//
//  Created by Ehsan Taghavi on 23.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let sheet = BottomSheetUIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }

    func setupViewHierarchy(){
        self.view.addSubview(sheet)
    }
    
    func setupViewAttributes(){
        self.view.backgroundColor = .blue
        sheet.translatesAutoresizingMaskIntoConstraints = false
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        
        gestureRecognizer.cancelsTouchesInView = false
        sheet.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer){
        if gesture.state == .began {
            print("Began")
        } else if gesture.state == .changed {
            let translation = gesture.translation(in: self.view)
            
            if((self.view.frame.height - sheet.center.y>150 && translation.y < 0  ) || (self.view.frame.height - sheet.center.y < 0 && translation.y > 0)){
                print("Block")
            }else{
                gesture.view?.center=CGPoint(x: gesture.view!.center.x, y: gesture.view!.center.y + translation.y)
                gesture.setTranslation(CGPoint.zero, in: self.view)
            }
            
            if (self.view.frame.height - sheet.center.y > 150){
                sheet.center.y = self.view.frame.height - 150
            }
            
            if (self.view.frame.height - sheet.center.y < 0){
                sheet.center.y = self.view.frame.height
            }
            
        } else if gesture.state == .ended{
            gesture.view?.center = CGPoint(x: self.sheet.center.x, y: self.sheet.center.y)
                        
            UIView.animate(withDuration: 0.15, animations: {
                if(self.view.frame.height - self.sheet.center.y < 60){
                    self.sheet.center.y = self.view.frame.height
                }else{
                    self.sheet.center.y = self.view.frame.height - 150
                }
            })
            print("Ended")
        }
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            sheet.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            sheet.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200),
            sheet.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            sheet.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}

