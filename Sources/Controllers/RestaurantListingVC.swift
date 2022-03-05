//
//  RestaurantListingVC.swift
//  RestaurantModule
//
//  Created by Muhammad Arslan Khalid on 05/03/2022.
//

import UIKit
import SnapKit
import SDWebImage
import Combine


public class RestaurantListingVC: UIViewController {
    
    let collectionView: UICollectionView! = {
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .plain)
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        let list = UICollectionView(frame: CGRect.zero, collectionViewLayout: listLayout)
        
        return list;
    }();
    
    let waitingIndicator:UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView();
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.tintColor = UIColor.purple
        return activityIndicator;
    }();
    
    private var dataSource:UICollectionViewDiffableDataSource<Section, ViewModelRestaurant>!
    private var snapshot:NSDiffableDataSourceSnapshot<Section, ViewModelRestaurant>!
    
    private var viewModel = ViewModelRestaurantPage(restaurantRepo: RestaurantRepo());
    
    enum Section {
            case main
        }
    
    private var cancelable = Set<AnyCancellable>()
    
    public init() {
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.methodsOnViewLoaded()
        self.navigationController?.navigationBar.isTranslucent = true;
        self.title = "Restaurant Lists"
    }
    
    public override func loadView() {
        self.view = UIView();
        self.view.backgroundColor = UIColor.white
        self.constructHierarchy()
        self.activateConstraints()
        
    }
    
    
}

//MARK:- Utility Methods
extension RestaurantListingVC{
    func constructHierarchy() {
        self.view.addSubview(self.collectionView);
        self.view.addSubview(self.waitingIndicator);
    }
    
    func activateConstraints() {
        self.activateCollectionViewConstraints();
        self.activateWaitingIndicatorConstraint();
    }
    
    func activateCollectionViewConstraints(){
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false;
        self.collectionView.snp.makeConstraints { make in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func activateWaitingIndicatorConstraint(){
        self.waitingIndicator.translatesAutoresizingMaskIntoConstraints = false;
        self.waitingIndicator.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
    }
    
    func methodsOnViewLoaded(){
        self.configureCollectionView()
        self.addRequiredObservers()
        self.viewModel.fetchRestaurantList();
    }
    
    
    
    func configureCollectionView(){
        let cellRegistration = self.registerCell();
        self.makeDataSource(cellRegistration: cellRegistration)
        self.createSnapShot()
        self.applyReloadSnapShot();
    }
    
    func registerCell() -> UICollectionView.CellRegistration<RestaurantListCell, ViewModelRestaurant>{
        let cellRegistration = UICollectionView.CellRegistration<RestaurantListCell, ViewModelRestaurant> { (cell, indexPath, item) in
                cell.item = item
            }
        return cellRegistration;
    }
    
    
    func makeDataSource(cellRegistration:UICollectionView.CellRegistration<RestaurantListCell, ViewModelRestaurant>){
        
        dataSource = UICollectionViewDiffableDataSource<Section, ViewModelRestaurant>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: ViewModelRestaurant) -> UICollectionViewCell? in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                                    for: indexPath,
                                                                    item: identifier)
            return cell
        }
    }
    
    func createSnapShot(){
        snapshot = NSDiffableDataSourceSnapshot<Section, ViewModelRestaurant>()
        snapshot.appendSections([.main])
    }
    
    func applyReloadSnapShot(){
        self.snapshot.appendItems(self.viewModel.restaurants, toSection: .main)
        self.dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func addRequiredObservers(){
        self.viewModel.reloadUI
            .receive(on: DispatchQueue.main, options: nil)
            .sink {[weak self] reload in
                guard let self = self else {return}
                self.applyReloadSnapShot()
            }
            .store(in: &self.cancelable)
        
        self.viewModel.isLoading
            .receive(on: DispatchQueue.main, options: nil)
            .sink {[weak self] isShown in
                guard let self = self else {return}
                self.showHideHUD(isShown: isShown)
            }
            .store(in: &self.cancelable)
        
        self.viewModel.errorHandler
            .receive(on: DispatchQueue.main, options: nil)
            .sink {[weak self] error in
                guard let self = self else {return}
                self.showError(error: error);
            }
            .store(in: &self.cancelable)
    }
    
    func showHideHUD(isShown:Bool){
        if(isShown){
            self.waitingIndicator.startAnimating()
        }
        else{
            self.waitingIndicator.stopAnimating()
        }
    }
    
    func showError(error:RestaurantErrorModel){
        
    }
    
}








