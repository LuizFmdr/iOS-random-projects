import UIKit

class ColorsTableViewController: UIViewController {
    
    var colors: [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()

      creatRandomColors()
    }
    
    func creatRandomColors(){
        for _ in 0..<50 {
            let color = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
            colors.append(color)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destV = segue.destination as! ColorsDetailViewController
        destV.color = sender as? UIColor
    }
    
}

extension ColorsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
        
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else{
            return UITableViewCell()
        }
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
     performSegue(withIdentifier: "toColorsDetails", sender: color)
    }
}
