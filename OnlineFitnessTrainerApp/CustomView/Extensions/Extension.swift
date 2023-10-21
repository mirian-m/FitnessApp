//
//  Extension.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/10/23.
//

import UIKit
// MARK:- PickerView extesions
extension UserInfoViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { dataManager.numberOfItems }
}

extension UserInfoViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat { Const.Size.pickerViewRowWidth }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { Const.Size.pickerViewRowHeight }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
//        pickerView.subviews[2].backgroundColor = .clear

        let design = createItemDesign(for: row)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Const.Size.pickerViewRowWidth, height: Const.Size.pickerViewRowHeight))
        let labal = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        labal.textAlignment = .center
        labal.font = design.font
        labal.textColor = design.color
        labal.text = dataManager.getDataAt(index: row)
        labal.transform = CGAffineTransform(rotationAngle: -rotationAngel)
        view.addSubview(labal)
        return view
    }
    
    private func createItemDesign(for row: Int) -> (color: UIColor, font: UIFont) {
        let itemsDesign: (color: UIColor, font: UIFont)
        if selectedItemIndex == row {
            itemsDesign.color = Const.Colors.highlightBackgroundColor
            itemsDesign.font = UIFont(name: "HelveticaNeue-Bold", size: 35)!
        } else {
            itemsDesign.color = Const.Colors.tintColorWhite
            itemsDesign.font = UIFont(name: "HelveticaNeue-Bold", size: 20)!
        }
        return itemsDesign
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { pickerView.reloadAllComponents() }
}
