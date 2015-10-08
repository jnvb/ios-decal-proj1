import UIKit

class CustomCell: UITableViewCell
{
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var whenLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}