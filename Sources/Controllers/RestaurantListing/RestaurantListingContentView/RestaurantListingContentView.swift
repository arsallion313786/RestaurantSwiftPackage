//
//  RestaurantListingContentView.swift
//  RestaurantSwiftPackage
//
//  Created by Muhammad Arslan Khalid on 05/03/2022.
//

import Foundation
import UIKit

class RestaurantListingContentView: UIView, UIContentView {
    
    
    let restaurantImageView:UIImageView! = {
        let imgV = UIImageView();
        imgV.clipsToBounds = true;
        imgV.contentMode = .scaleAspectFill;
        imgV.layer.cornerRadius = 25
        return imgV;
    }();
    
    let lblRestaurantName:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textColor  = UIColor.black
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        return lbl;
    }();
    
    
    let lblRestaurantDistance:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor  = UIColor.black
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }();
    
    
    private var currentConfiguration: RestaurantContentConfiguration!
    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        }
        set {
            guard let newConfiguration = newValue as? RestaurantContentConfiguration else {
                return
            }
            apply(configuration: newConfiguration)
        }
    }
    
    
    
    init(configuration: RestaurantContentConfiguration) {
        // Custom initializer implementation here.
        super.init(frame: .zero)
        self.constructHierarchy()
        self.activateConstraints();
        
        apply(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func apply(configuration: RestaurantContentConfiguration) {
        
        guard currentConfiguration != configuration else {
            return
        }
        
        
        currentConfiguration = configuration
        
        
        self.restaurantImageView.sd_setImage(with: configuration.restaurantImageURL, placeholderImage: RestaurantModueConstants.AppImages.generalPlaceHolderImage, options: .continueInBackground, completed: nil)
        self.lblRestaurantName.text = configuration.name
        self.lblRestaurantDistance.text = configuration.distance;
        
        
    }
    
    
}


private extension RestaurantListingContentView{
    func constructHierarchy() {
        addSubview(self.restaurantImageView)
        addSubview(self.lblRestaurantName)
        addSubview(self.lblRestaurantDistance)
    }
    
    func activateConstraints() {
        self.activateRestaurantImagViewConstraints();
        self.activateConstraintLableRestaurantName();
        self.activateConstraintLableRestaurantDistance();
        
        
    }
    
    func activateRestaurantImagViewConstraints(){
        self.restaurantImageView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.centerY.equalTo(self)
        }
    }
    
    func activateConstraintLableRestaurantName(){
        self.lblRestaurantName.snp.makeConstraints { make in
            make.left.equalTo(self.restaurantImageView.snp.right).offset(10)
            make.top.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-10)
            
            
        }
    }
    
    func activateConstraintLableRestaurantDistance(){
        self.lblRestaurantDistance.setContentCompressionResistancePriority(.required, for: .vertical)
        self.lblRestaurantDistance.snp.makeConstraints { make in
            make.left.equalTo(self.restaurantImageView.snp.right).offset(10)
            make.right.equalTo(self).offset(-10)
            make.top.equalTo(self.lblRestaurantName.snp.bottom).offset(9)
           
            make.bottom.equalTo(self.snp.bottom).offset(-16);
            
        }
    }
}
