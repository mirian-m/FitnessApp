//
//  PageViewModelManager.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/28/23.
//

import Foundation

final class PageViewModelManager {
    // MARK:- Private Property
    private var pageArray = [PageViewModel]()
    private var pageIndex: Int = 0
    
    init() {
        createDummyArray()
    }
    
    private func createDummyArray() {
        pageArray.append(contentsOf: [PageViewModel(imageName: "Page1", text: "Find The right workout for what you need", pageIndex: 0),
                                      PageViewModel(imageName: "Page2", text: "Make suitable workouts and get results", pageIndex: 1),
                                      PageViewModel(imageName: "Page3", text: "Lets do the workout and be healthy with us", pageIndex: 2)
        ])
    }
    // MARK:- Public Methods
    func getNextPage() -> PageViewModel? {
        pageIndex += 1
        guard pageIndex <= pageArray.count - 1 else { return nil}
        return pageArray[pageIndex]
    }
    
    func getPageIndex() -> Int { pageIndex }
}
