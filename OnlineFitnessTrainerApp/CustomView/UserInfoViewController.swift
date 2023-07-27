//
//  AgeViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/30/23.
//
import UIKit

class UserInfoViewController: UIViewController, Listener {
    
    // MARK:- Private properties
    private lazy var pickerView: UIPickerView = {
        let pickView = UIPickerView()
        pickView.backgroundColor = .clear
        pickView.transform = CGAffineTransform(rotationAngle: rotationAngel)
        return pickView
    }()
    
    private var viewConstrollerTitle: String!
    private var subTitle: String!
    private var initView: UIView?
    private var middleIndex: Int {
        dataManager.numberOfItems / 2
    }
    
    // MARK:- Public properties
    public var dataManager: DataCreateManager {
        DataCreateManager()
    }
    
    public var selectedItemIndex: Int {
        pickerView.selectedRow(inComponent: 0)
    }
    public var rotationAngel: CGFloat!

    // MARK:- Viewconstroller LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(middleIndex, inComponent: 0, animated: true)
        setCustomView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pickerView.subviews.forEach { $0.backgroundColor = .clear }
    }
    
    // MARK:- Init func
    init(
        title: String?,
        subTitle: String?,
        myCustomView: UIView? = nil,
        rotationAngel: CGFloat? = 0
    ){
        super.init(nibName: nil, bundle: nil)
        
        setOutlets(
            title: title,
            subTitle: subTitle,
            view: myCustomView,
            rotationAngel: rotationAngel
        )
    }
    
    required convenience init?(coder: NSCoder) {
        self.init(
            title: nil,
            subTitle: nil,
            myCustomView: nil,
            rotationAngel: nil
        )
    }
    
    // MARK:- Private Methods
    private func setOutlets(title: String?, subTitle: String?, view: UIView?, rotationAngel: CGFloat?) {
        if let title = title, let subTitle = subTitle {
            self.viewConstrollerTitle = title
            self.subTitle = subTitle
            self.initView = view
            self.rotationAngel = rotationAngel
        }
    }
    
    // Add Custom view with Title and subtitle
    private func setCustomView() {
        self.view = CustomView(title: viewConstrollerTitle,
                               subTitle: subTitle,
                               delegate: self
        )
        let view = initView == nil ? pickerView: initView
        
        //  downcast viewcontroller.view to CustomView
        guard let backgroundView = (self.view as? CustomView) else { return }
        backgroundView.centerStackView.addArrangedSubview(view!)
    }
    
    // Button Action Method
    public func buttonPressd(_ sender: UIButton?) {
        switch sender?.currentTitle {
        case "Back":
            self.navigationController?.popViewController(animated: true)
        default:
            self.navigationController?.pushViewController(UIViewController(), animated: true)
        }
    }
}

