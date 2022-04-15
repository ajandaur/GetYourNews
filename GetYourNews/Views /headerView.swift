

import UIKit

class HeaderView: UIView {
    
    private var fontSize: CGFloat
    
    // create a heading label
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "News"
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        return label
    }()
    
    private lazy var headerCircleImage: UIImageView = {
        let headerImage = UIImageView()
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        headerImage.contentMode = .scaleAspectFit
        let configuration = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        headerImage.image = UIImage(systemName: "largecircle.fill.circle", withConfiguration: configuration)
        return headerImage
    }()
    
    private lazy var plusImage: UIImageView = {
        let plusImg = UIImageView()
        plusImg.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        plusImg.image = UIImage(systemName: "plus", withConfiguration: configuration)?.withRenderingMode(.alwaysOriginal)
        return plusImg
    }()
    
    private lazy var subheadlineLabel: UILabel = {
        let subheadLabel = UILabel()
        subheadLabel.translatesAutoresizingMaskIntoConstraints = false
        subheadLabel.font = subheadLabel.font.withSize(fontSize)
        subheadLabel.text = "Top Stories"
        subheadLabel.textColor = .gray
        return subheadLabel
        
    }()
    
    private lazy var headerStackView: UIStackView =  {
        let stackView = UIStackView(arrangedSubviews: [headerCircleImage, headingLabel, plusImage])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        
        addSubview(headerStackView)
        addSubview(subheadlineLabel)
        
        configureConstraints()
    }
    
    func configureConstraints() {
        
        // news header config
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        // subheadline
        NSLayoutConstraint.activate([
            subheadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subheadlineLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
            subheadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
}
