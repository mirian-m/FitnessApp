//
//  GoalViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/3/23.
//

import UIKit

final class GoalViewController: UserInfoViewController {
    
    private let manager = GoalDataManager()
    
    // MARK:- Private outlets
    private var goalTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.register(GoalTableViewCell.self, forCellReuseIdentifier: GoalTableViewCell.identifier)
        return tableView
    }()
    
    // MARK:- View Controller life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTableView.dataSource = self
        goalTableView.delegate = self
        binder()
    }
    
    init() {
        super.init(title: "What is Your Goal?",
                   subTitle: "You can choose  more then one. Don't worry you can always change it later.",
                   myCustomView: self.goalTableView
        )
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
    // MARK:- Private Methods
    private func binder() {
        manager.goalsSelection.bind { _ in
            self.goalTableView.reloadData()
        }
    }
    
    // MARK:- Override Method
    override func buttonPressd(_ sender: UIButton?) {
        switch sender?.currentTitle {
        case "Back":
            self.navigationController?.popViewController(animated: true)
        default:
            let goals = manager.getSelectedGoals()
            
            //  save user goal
            UserDataService.shared.updateGoal(goals)
            self.navigationController?.pushViewController(ActivityViewController(), animated: true)
        }
    }
}

extension GoalViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.goalNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //  Create reusable cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GoalTableViewCell.identifier, for: indexPath) as? GoalTableViewCell else { return UITableViewCell()}
        
        //  Update Cell method
        cell.updateCell(with: manager.getDataAt(index: indexPath.row),
                        isChecked: manager.goalsSelection.value?[indexPath.row] ?? false)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        //  Update tapped cell check mark value
        manager.updateGoalSelection(at: indexPath.row)
    }
}
