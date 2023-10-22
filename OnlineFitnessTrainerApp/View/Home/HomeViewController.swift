//
//  HomeViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/26/23.
//

import UIKit

final class HomeViewController: UIViewController {
    private let heightConst = 220
    private var manager = HomeManager()
    
    private lazy var featureWorkoutCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: Int(view.frame.width), height: heightConst)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: Int(view.frame.width), height: heightConst),
            collectionViewLayout: layout
        )
        
        collectionView.showsVerticalScrollIndicator = true
        collectionView.register(FeatureWorkoutCollectionViewCell.self,
                                forCellWithReuseIdentifier: FeatureWorkoutCollectionViewCell.identifier)
        
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Const.Colors.backgroundColorDark
        featureWorkoutCollectionView.delegate = self
        featureWorkoutCollectionView.dataSource = self
        navigationBarConfigure()
        bind()
        manager.fetchData()
    }
    
    private func navigationBarConfigure() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        tabBarController?.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .clear
        let image = Const.Icon.goFitIcon
        let customBtn = UIButton()
        customBtn.buttonSet(image, "GoFit")
        let btn = UIBarButtonItem(customView: customBtn)
        tabBarController?.navigationItem.setLeftBarButton(btn, animated: true)
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
        
        tabBarController?.navigationItem.title = "Good Morning 👋"
        
    }
    private func bind() {
        manager.workOuts.bind { workOutPlan in
            print(workOutPlan?.first?.difficulty! ?? "")
        }
    }
}

// MARK:- Extension Delegat methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeatureWorkoutCollectionViewCell.identifier, for: indexPath) as? FeatureWorkoutCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    

}
