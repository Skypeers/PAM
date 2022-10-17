//
//Вариант1.
//Создайте мобильное приложение, которое будет рассчитывать ваш индекс массы тела (ИМТ)
// 
//Вариант2.
//Создайте мобильное приложение, которое будет подсчитывать количество слов, содержащих букву "А" в тексте, введенном пользователем.
// 
//Вариант3.
//Создайте мобильное приложение, которое будет вычислять возраст пользователя, введя дату, год и день его рождения.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculateButtonOne: UIButton!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var textFieldOneDotTwo: UITextField!
    @IBOutlet weak var textFieldOne: UITextField!
    
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var calculateButtonTwo: UIButton!
    @IBOutlet weak var textFieldTwo: UITextField!
    
    @IBOutlet weak var textFieldThree: UITextField!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var calculateButtonThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButtonOne(_ sender: Any) {
        self.calculateButtonOneFunc()
    }
    
    @IBAction func calculateButtonTwo(_ sender: Any) {
        self.calculateButtonTwoFunc()
    }
    
    @IBAction func calculateButtonThree(_ sender: Any) {
        self.calculateButtonThreeFunc()
    }
    
    @IBAction func editingDidEndOne(_ sender: Any) {
        self.calculateButtonOneFunc()
    }
    
    @IBAction func editingDidEndTwo(_ sender: Any) {
        self.calculateButtonTwoFunc()
    }
    
    @IBAction func editingDidEndThree(_ sender: Any) {
        self.calculateButtonThreeFunc()
    }
    
    
    private func calculateButtonOneFunc() {
        guard let weight = self.textFieldOne.text , let height = self.textFieldOneDotTwo.text else {
            return
        }
        let weightInt = Int(weight) ?? 0
        let heightInt = Int(height) ?? 0
        self.labelOne.text = "\(Double(weightInt)/pow(Double(heightInt), 2))"
    }
    
    private func calculateButtonTwoFunc() {
        guard let string = textFieldTwo.text else {
            return
        }
        self.labelTwo.text = "\(string.filter({ $0 == "a" }).count)"
    }
    
    func calculateButtonThreeFunc() {
        guard let birthday = textFieldThree.text else {
            return
        }
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate ?? Date(), to: now, options: [])
        self.labelThree.text = "\(calcAge.year ?? 0)"
        
    }
}

extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}
