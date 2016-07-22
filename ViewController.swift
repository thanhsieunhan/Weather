//
//  ViewController.swift
//  Weather
//
//  Created by le ha thanh on 7/14/16.
//  Copyright © 2016 le ha thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var tempButton: UIButton!
    
    @IBOutlet weak var thangDoLabel: UILabel!
    
    @IBOutlet weak var bgView: UIImageView!
    
    var quote = ["Cuộc sống vẫn vậy nếu nó lấy đi thứ gì của bạn, thì thế nào nó cũng bù lại cho bạn thứ khác, chỉ có điều là bạn có chịu đi tìm hay không thôi.","Đừng khóc vì chuyện đã kết thúc. hãy cười vì nó đã xảy ra.","Một câu chuyện chưa có bắt đầu sao có thể gọi tên bằng hai từ kết thúc."]
    
    var city = ["Hanoi","Tokyo","HCM"]
    
    var background = ["Blood","Moon","Sun"]
    
    var change = 1 // do C, false do F
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func action_change(sender: AnyObject) {
        var num = ""
        var nhiet_do: Double = Double((tempButton.titleLabel?.text)!)!
        if thangDoLabel.text == "C"{
            thangDoLabel.text = "F"
            num = String(format: "%2.1f", doiCsangF(nhiet_do))
            
        } else {
            
            thangDoLabel.text = "C"
            num = String(format: "%2.1f", doiFsangC(nhiet_do))
            tempButton.setTitle(String(doiFsangC(nhiet_do)), forState: .Normal)
        }
        
        tempButton.setTitle(num, forState: .Normal)
    }
    
    
    func doiCsangF(giatri : Double) -> Double{
        return giatri * 1.8 + 32
    }
    
    func doiFsangC(giatri : Double) -> Double{
        return (giatri - 32) / 1.8
    }
    
    func tempRandom() -> Double {
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
    }
    
    @IBAction func randomButton(sender: AnyObject) {
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        
        cityLabel.text = city[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quote.count)))
        
        quoteLabel.text = quote[quoteIndex]
        
        let imageIndex = Int(arc4random_uniform(UInt32(background.count)))
        
        bgView.image = UIImage.init(named:background[imageIndex])
        
        getTemp()
        
    }
    
    func getTemp() -> Void {
        var rd_nb = tempRandom()
        if thangDoLabel.text == "F" {
            rd_nb = doiCsangF(rd_nb)
        }
        
        var randomNumber = (String(format: "%2.1f", rd_nb))
        
        tempButton.setTitle(String(randomNumber), forState: .Normal)
        
    }
    
}

