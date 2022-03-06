//
//  RestaurantDetailVC.swift
//  RestaurantModule
//
//  Created by Muhammad Arslan Khalid on 06/03/2022.
//

import UIKit
import SnapKit
import SDWebImage
class RestaurantDetailVC: UIViewController {
    
    let scrollView:UIScrollView! = {
        let s = UIScrollView();
        s.backgroundColor = UIColor.white;
        return s;
    }()
    
    let contentView:UIView! = {
        let v = UIView();
        v.backgroundColor = UIColor.white;
        return v;
    }()
    
    let restaurantImageView:UIImageView! = {
        let imgV = UIImageView();
        imgV.image = RestaurantModueConstants.AppImages.generalPlaceHolderImage
        imgV.contentMode = .scaleAspectFill
        imgV.clipsToBounds = true
        return imgV;
    }()
    
    let lblRestaurantName:UILabel! = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        //lbl.text = "Kudu";
        return lbl;
    }()
    
    let lblRestaurantDescp:UILabel! = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        //lbl.text = "Enjoy fast delivery from Jahez. Order now, or schedule your order any time you want";
        return lbl;
    }()
    
    let lblRestaurantHours:UILabel! = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.black
        //lbl.text = "01:15 PM - 12:50 AM";
        lbl.textAlignment = .center
        return lbl;
    }()
    
    let lblRestaurantRating:UILabel! = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.black
        //lbl.text = "8.0";
        lbl.textAlignment = .center
        return lbl;
    }()
    
    
    private var viewModelRestaurantDetail:ViewModelRestaurantDetail!
    
    
    
    init(restaurant:Restaurant) {
        self.viewModelRestaurantDetail = ViewModelRestaurantDetail(restaurant: restaurant);
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func loadView() {
        self.view = UIView();
        self.view.backgroundColor = UIColor.white;
        self.constructHierarchy()
        self.activateConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.methodsOnViewLoaded()
    }
}

extension RestaurantDetailVC{
    func constructHierarchy() {
        view.addSubview(self.scrollView);
        self.scrollView.addSubview(self.contentView);
        self.contentView.addSubview(self.restaurantImageView);
        self.contentView.addSubview(self.lblRestaurantName)
        self.contentView.addSubview(self.lblRestaurantDescp);
        self.contentView.addSubview(self.lblRestaurantHours)
        self.contentView.addSubview(self.lblRestaurantRating)
        
    }
    
    func activateConstraints() {
        self.activateScrollConstraint();
        self.activateContentViewConstraints();
        self.acitvateRestaurantImgVConstraint();
        self.acitvateLblRestaurantNameConstraint();
        self.acitvateLblRestaurantDescpConstraint();
        self.activateRestaurantHours()
        self.activateRestaurantRatings()
        
        
    }
    
    func activateScrollConstraint(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.snp.makeConstraints { make in
            make.right.equalTo(self.view)
            make.left.equalTo(self.view)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func activateContentViewConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.snp.makeConstraints { make in
            make.centerX.equalTo(self.scrollView)
            make.centerY.equalTo(self.scrollView).priority(ConstraintPriority.low)
            make.right.equalTo(self.scrollView)
            make.left.equalTo(self.scrollView)
            make.top.equalTo(self.scrollView)
            make.bottom.equalTo(self.scrollView)
        }
        
    }
    
    func acitvateRestaurantImgVConstraint(){
        self.restaurantImageView.translatesAutoresizingMaskIntoConstraints = false;
        self.restaurantImageView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView)
            make.left.equalTo(self.contentView)
            make.right.equalTo(self.contentView)
            make.height.equalTo(UIScreen.main.bounds.height * 0.2)
        }
    }
    
    func acitvateLblRestaurantNameConstraint(){
        self.lblRestaurantName.translatesAutoresizingMaskIntoConstraints = false;
        self.lblRestaurantName.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        self.lblRestaurantName.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
        self.lblRestaurantName.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(10)
            make.top.equalTo(self.restaurantImageView.snp.bottom).offset(10)
            //make.bottom.equalTo(self.stackView.snp.top).offset(0);
        }
        
    }
    
    func acitvateLblRestaurantDescpConstraint(){
        self.lblRestaurantDescp.translatesAutoresizingMaskIntoConstraints = false;
        self.lblRestaurantDescp.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        self.lblRestaurantDescp.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
        self.lblRestaurantDescp.snp.makeConstraints { make in
            make.left.equalTo(self.lblRestaurantName.snp.right).offset(8)
            make.top.equalTo(self.restaurantImageView.snp.bottom).offset(10)
            make.right.equalTo(self.contentView).offset(-10)
        }
    }
    
    func activateRestaurantHours(){
        self.lblRestaurantHours.translatesAutoresizingMaskIntoConstraints = false
        self.lblRestaurantHours.snp.makeConstraints { make in
            make.top.equalTo(self.lblRestaurantDescp.snp.bottom).offset(10)
            make.left.equalTo(self.contentView).offset(10)
            make.bottom.greaterThanOrEqualTo(self.contentView).offset(-20)
            make.width.equalTo(self.lblRestaurantRating)
            make.height.equalTo(self.lblRestaurantRating)
        }
    }
    
    func activateRestaurantRatings(){
        self.lblRestaurantRating.translatesAutoresizingMaskIntoConstraints = false
        self.lblRestaurantRating.snp.makeConstraints { make in
            make.top.equalTo(self.lblRestaurantDescp.snp.bottom).offset(10)
            make.left.equalTo(self.lblRestaurantHours.snp.right).offset(10)
            make.right.equalTo(self.contentView).offset(-10)
            make.bottom.greaterThanOrEqualTo(self.contentView).offset(-20)
        }
    }
    
    func methodsOnViewLoaded(){
        self.configureNavBar()
        self.setUI(data: self.viewModelRestaurantDetail);
    }
    
    func configureNavBar(){
        self.navigationController?.navigationBar.isTranslucent = true;
        self.title = "Restaurant Detail"
    }
    
    func setUI(data:ViewModelRestaurantDetail){
        self.restaurantImageView.sd_setImage(with: data.imgURL, placeholderImage: RestaurantModueConstants.AppImages.generalPlaceHolderImage, options: .continueInBackground, completed: nil)
        self.lblRestaurantName.text = data.name
        self.lblRestaurantDescp.text = data.descp
        self.lblRestaurantHours.text = data.hours
        self.lblRestaurantRating.text = data.rating;
    }
}


