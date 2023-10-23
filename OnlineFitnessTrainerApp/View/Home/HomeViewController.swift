//
//  HomeViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/26/23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK:- Private properties
    private let heightConst = 220
    private var manager = HomeManager()
    private let collectionHeader = CustomHeaderView(title: "Feature Workout")
    private let headerForLeveView = CustomHeaderView(title: "Workout Level")
    private let levelView = LevelView()
    //  Create collection view programmaticaly
    private lazy var workoutCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: Int(view.frame.width), height: heightConst)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.register(WorkoutCollectionViewCell.self,
                                forCellWithReuseIdentifier: WorkoutCollectionViewCell.identifier)
        
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK:- Life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
        manager.fetchData()
    }
}

// MARK:- Private Methods
extension HomeViewController {
    
    private func configurationUI() {
        view.backgroundColor = Const.Colors.backgroundColorDark
        workoutCollectionView.delegate = self
        workoutCollectionView.dataSource = self
        navigationBarConfigure()
        addConstraints()
        bind()
    }
    
    //  Configuration of navigation bar
    private func navigationBarConfigure() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        tabBarController?.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .clear
        
        //  Create image for logo
        let image = Const.Icon.goFitIcon
        
        let customBtn = UIButton()
        customBtn.buttonSet(image, "GoFit")
        
        let btn = UIBarButtonItem(customView: customBtn)
        
        //  Set left bar button
        tabBarController?.navigationItem.setLeftBarButton(btn, animated: true)
        
        //  Set Right bar buttons
        tabBarController?.navigationItem.setRightBarButtonItems([
            UIBarButtonItem(image: Const.Icon.bookmarkIcon
                                .withConfiguration(UIImage.SymbolConfiguration(pointSize: 13))
                                .withTintColor(.white, renderingMode: .alwaysOriginal),
                            style: .done, target: self, action: nil),
            
            UIBarButtonItem(image: Const.Icon.bellIcon
                                .withConfiguration(UIImage.SymbolConfiguration(pointSize: 13))
                                .withTintColor(.white, renderingMode: .alwaysOriginal),
                            style: .done, target: self, action: nil)
        ], animated: true)
        
        tabBarController?.navigationItem.title = "Hello 'Name' 👋"
    }
    
    // MARK:- Bind method
    private func bind() {
        manager.workOuts.bind { workOutPlan in
            print(workOutPlan?.first?.difficulty! ?? "")
        }
    }
}

// MARK:- Extension Delegate & Datasource methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 1 }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { 100 }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutCollectionViewCell.identifier, for: indexPath) as? WorkoutCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}

extension HomeViewController {
    
    private func addConstraints() {
        //  Add subviews
        view.addSubview(collectionHeader)
        view.addSubview(workoutCollectionView)
        view.addSubview(headerForLeveView)
        view.addSubview(levelView)
        
        //  Prepare for adding constraints
        collectionHeader.translatesAutoresizingMaskIntoConstraints = false
        workoutCollectionView.translatesAutoresizingMaskIntoConstraints = false
        headerForLeveView.translatesAutoresizingMaskIntoConstraints = false
        levelView.translatesAutoresizingMaskIntoConstraints = false
        
        //  Collection Header add constraints
        collectionHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        collectionHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        collectionHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //  CollectionView add constraints
        workoutCollectionView.topAnchor.constraint(equalTo: collectionHeader.bottomAnchor).isActive = true
        workoutCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        workoutCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        workoutCollectionView.heightAnchor.constraint(equalToConstant: CGFloat(heightConst)).isActive = true
        
        //  Level buttons header add constraints
        headerForLeveView.leadingAnchor.constraint(equalTo: collectionHeader.leadingAnchor).isActive = true
        headerForLeveView.topAnchor.constraint(equalTo: workoutCollectionView.bottomAnchor).isActive = true
        headerForLeveView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //  Level view add constraints
        levelView.leadingAnchor.constraint(equalTo: collectionHeader.leadingAnchor).isActive = true
        levelView.topAnchor.constraint(equalTo: headerForLeveView.bottomAnchor, constant: 15).isActive = true
        levelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        levelView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
