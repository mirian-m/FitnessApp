//
//  PageView.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 6/27/23.
//
import UIKit

final class PageView: UIView {
    
    private var posterImageName: String!
    private var text: String!
    private weak var delegate: Listener?
    
    private lazy var poster: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
        return imageView
    }()
    
    lazy var pageview: UIPageControl = {
        let page = UIPageControl()
        page.isEnabled = false
        page.numberOfPages = 3
        page.tintColor = Const.Colors.backgroundColorLightDark
        page.currentPageIndicatorTintColor = Const.Colors.highlightBackgroundColor
        return page
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.addArrangedSubview(header)
        stack.addArrangedSubview(pageview)
        stack.addArrangedSubview(nextButton)
        self.addSubview(stack)
        return stack
    }()
    
    private lazy var header: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.font = Const.Fonts.title
        lb.adjustsFontSizeToFitWidth = true
        lb.minimumScaleFactor = 0.6
        lb.textColor = Const.Colors.tintColorWight
        lb.textAlignment = .center
        return lb
    }()
    
    private lazy var nextButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.backgroundColor = Const.Colors.highlightBackgroundColor
        btn.setTitle("Next", for: .normal)
        btn.tintColor = Const.Colors.tintColorWight
        btn.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return btn
    }()
    
    // MARK:- View LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Const.Colors.backgroundColorDark
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(posterImage: String?, text: String?, delegate: Listener) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.posterImageName = posterImage
        self.text = text
        self.delegate = delegate
        self.updateView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustConstraints()
    }
    
    func updateViewComponents(with viewModel: PageViewModel) {
        posterImageName = viewModel.imageName
        text = viewModel.text
        pageview.currentPage = viewModel.pageIndex
        updateView()
    }
    
    // MARK:- Private Methods
    private func updateView() {
        poster.image = UIImage(named: posterImageName)
        header.text = text
    }
    
    private func adjustConstraints() {
        
        poster.anchor(top: self.topAnchor, paddingTop: 0,
                      bottom: nil, paddingBottom: 0,
                      left: self.leftAnchor, paddingLeft: 0,
                      right: nil, paddingRight: 0,
                      width: 0,
                      height: self.bounds.height * 0.6,
                      centerX: self.centerXAnchor,
                      centerY: nil)
        
        stack.anchor(top: poster.bottomAnchor, paddingTop: 50,
                     bottom: nil, paddingBottom: 0,
                     left: self.safeAreaLayoutGuide.leftAnchor, paddingLeft: 30,
                     right: nil, paddingRight: 0,
                     width: 0,
                     height: self.bounds.height * 0.25,
                     centerX: self.centerXAnchor,
                     centerY: nil)
    }
    
    @objc private func buttonClicked() {
        delegate?.buttonPressd(nil)
    }
}
