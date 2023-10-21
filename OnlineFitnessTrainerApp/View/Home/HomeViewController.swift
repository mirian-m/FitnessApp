//
//  HomeViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/26/23.
//

import UIKit

final class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
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
        
        collectionView.center = view.center
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Const.Colors.backgroundColorDark
        featureWorkoutCollectionView.delegate = self
        featureWorkoutCollectionView.dataSource = self

        bind()
        manager.fetchData()
    }
    
    private func bind() {
        manager.workOuts.bind { workOutPlan in
            print(workOutPlan?.first?.difficulty! ?? "")
        }
    }
    
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
