
import Foundation
import UIKit

final class DataCreateManager {
    private lazy var data = (from...to).map { String($0) }
    public var from: Int
    public var to: Int
    
    var numberOfItems: Int {
        data.count
    }
    
    init(firstNumber: Int = 0, lastNumber: Int = 0) {
        self.from = firstNumber
        self.to = lastNumber
    }
    func getDataAt(index: Int) -> String { data[index] }
}
