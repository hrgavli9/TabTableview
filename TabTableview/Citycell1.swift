//
//  Citycell1.swift
//  TabTableview
//
//  Created by Dipak on 11/04/1943 Saka.
//

import UIKit

class Citycell1: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private let myimgview:UIImageView = {
       let imgview=UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 40
        imgview.alpha = 0
        imgview.clipsToBounds = true
        return imgview
    }()
    
    private let mylabel:UILabel = {
        let lb=UILabel()
        
        lb.font = .boldSystemFont(ofSize: 28)
        return lb
    }()
    
    public let myButton:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.right.2"), for: .normal)
        btn.tintColor = .black
        btn.alpha = 0
        return btn
    }()
    
    func setupcitycellwith(title name:String, index:Int, and state:Bool)
    {
        myimgview.image = UIImage(named: name)
        mylabel.text = name
        myButton.tag = index
        
        setupui(at:index,with:state)
    }
    
    private func setupui(at index:Int,with state:Bool)
     {
        contentView.addSubview(myimgview)
        contentView.addSubview(mylabel)
        contentView.addSubview(myButton)
        
        myimgview.frame = CGRect(x: 20, y: 10, width: 80, height: 80)
        if state
        {
            mylabel.frame = CGRect(x: myimgview.right+20, y: 10, width: 140, height: 80)
            myButton.alpha = 1
            myimgview.alpha = 1
        }
        else
        {
            mylabel.frame = CGRect(x: 20, y: 10, width: 140, height: 80)
            myButton.alpha = 0
            myimgview.alpha = 0
        }
        myButton.frame = CGRect(x: contentView.width-80, y: 10, width: 40, height: 80)
     }
    
    func animateCell(at index:Int) {
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear)
        {
            self.myimgview.transform = self.myimgview.transform.rotated(by: .pi)
            self.myimgview.alpha = 0.5
            self.myButton.alpha = 0.5
            self.mylabel.frame.origin.x = self.myimgview.right + 20
        }
        completion: { _ in
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear) {
                self.myimgview.transform = self.myimgview.transform.rotated(by: .pi)
                self.myimgview.alpha = 1
                self.myButton.alpha = 1
            }
        }
    }

}
