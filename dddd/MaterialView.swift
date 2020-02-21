

import UIKit

class MaterialView: UIView
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup()
    {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.cornerRadius = 5;
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
        //self.clipsToBounds = true
        self.backgroundColor = UIColor.white

    }

}
