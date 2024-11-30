//
//  ViewController.swift
//  HikingTrails_Fall23
//
//  Created by Don Almeida on 9/11/23.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var lblTrailName: UILabel!
    
    @IBOutlet weak var txtTrailDescription: UITextView!
   
    @IBOutlet weak var lblLength: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblElevation: UILabel!
    
    @IBOutlet weak var lblRoute: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblDifficulty: UILabel!
   
    @IBOutlet weak var lblDiffColor: UILabel!
    
    @IBOutlet weak var imgTrailImage: UIImageView!

    @IBOutlet weak var scAreaOne: UIScrollView!
    
    
    @IBOutlet weak var swFav: UISwitch!
    
    //var HikingTrailArray = ["Bull Run", "Old Rag", "Raven's Rock", "Appalachian Trail", "Great Falls Trails"]
    var HikingTrailArray = [HikingTrail]()
    var randomTrail = HikingTrail()
    
    var mySoundFile: AVAudioPlayer!
    // Allocate mem for the sound varaible and initialize the variable - written in the viewDidLoad Function
    // call the Play() / Stop() / pause() / Rewind() / forward()
    // written in the SetLables Function
    
    
    @IBAction func swFavValChanged(_ sender: Any) {
        if(swFav.isOn)  {
            UserDefaults.standard.set(lblTrailName.text, forKey: "favorite")
        }
        else {
            UserDefaults.standard.set("", forKey: "favorite")
        }
        
        
    }
    
    @IBAction func btnNextTrail(_ sender: Any) {
        
        setLabels()
        
               
    }
    
    
    @IBAction func btnWebSite(_ sender: Any) {
        let browserApp = UIApplication.shared
        
        let url = URL(string: randomTrail.TrailWebSite)
        
        browserApp.open(url!)
        
    }
    
    
    func setLabels() {
        randomTrail = HikingTrailArray.randomElement()!
        
        lblTrailName.text = randomTrail.TrailName
        txtTrailDescription.text = randomTrail.TrailDescription
        lblLength.text = randomTrail.TrailLength
        
        lblTime.text = randomTrail.TrailTime
        lblRoute.text = randomTrail.TrailRoute
        lblAddress.text = randomTrail.TrailAddress
        lblElevation.text = randomTrail.TrailElevation
        lblDifficulty.text = randomTrail.TrailDifficulty
        
        let fav = UserDefaults.standard.string(forKey: "favorite")
        swFav.isOn = (randomTrail.TrailName == fav )
        
        switch (randomTrail.TrailDifficulty) {
        case "Hard":
            lblDiffColor.backgroundColor = UIColor(red:241/255, green:92/255, blue:12/255, alpha: 1)
         break
        case "Moderate":
            lblDiffColor.backgroundColor = UIColor(red:241/255, green:222/255, blue:24/255, alpha: 1)
         break
        case "Easy":
            lblDiffColor.backgroundColor = UIColor(red:46/255, green:241/255, blue:25/255, alpha: 1)
         break
        default :
            lblDiffColor.backgroundColor = UIColor(red:182/255, green:219/255, blue:255/255, alpha: 1)
            
        }
        
        
        imgTrailImage.image = UIImage(named: randomTrail.TrailImage)
        imgTrailImage.layer.cornerRadius = 15
        imgTrailImage.layer.borderColor = UIColor.darkGray.cgColor
        imgTrailImage.layer.borderWidth = 2
        imgTrailImage.contentMode  = .scaleAspectFill
        
        txtTrailDescription.layer.cornerRadius = 15
        txtTrailDescription.layer.borderColor = UIColor.darkGray.cgColor
        txtTrailDescription.layer.borderWidth = 1
        
        scAreaOne.layer.cornerRadius = 15
        scAreaOne.layer.borderColor = UIColor.darkGray.cgColor
        scAreaOne.layer.borderWidth = 1
        
        mySoundFile.play()
        
    }
    
    
    func InitilizeData() {
        let ht1 = HikingTrail()
        ht1.TrailName = "Old Rag Mountain Loop"
        ht1.TrailDescription = "Explore this 9.3-mile loop trail near Etlan, Virginia. Generally considered a challenging route. This is a very popular area for hiking, so you'll likely encounter other people while exploring. The best times to visit this trail are May through October. You'll need to leave pups at home — dogs aren't allowed on this trail."
        ht1.TrailLength = "9.3 mi"
        ht1.TrailAddress = "Shenandoah National Park"
        ht1.TrailDifficulty = "Hard"
        ht1.TrailElevation = "2595 ft"
        ht1.TrailRoute = "Loop"
        ht1.TrailTime = "8 hrs"
        ht1.TrailWebSite = "https://www.alltrails.com/trail/us/virginia/old-rag-mountain-loop-trail"
        ht1.TrailImage = "Jeremystrail.jpg"
        HikingTrailArray.append(ht1)
        
        let ht2 = HikingTrail()
        ht2.TrailName = "Strickler Knob Trail"
        ht2.TrailDescription = "Explore this 8.9-mile out-and-back trail near New Market, Virginia. Generally considered a challenging route. This trail is great for hiking and running, and it's unlikely you'll encounter many other people while exploring. The trail is open year-round and is beautiful to visit anytime."
        ht2.TrailLength = "8.9"
        ht2.TrailAddress = "George Washington and Jefferson National Forests"
        ht2.TrailDifficulty = "Moderate"
        ht2.TrailElevation = "984 ft."
        ht2.TrailRoute = "Out & back"
        ht2.TrailTime = "6 hrs."
        ht2.TrailImage = "greatfalls.jpg"
        ht2.TrailWebSite = "https://www.alltrails.com/trail/us/virginia/strickler-knob-trail"
        HikingTrailArray.append(ht2)
        
        let ht3 = HikingTrail()
        ht3.TrailName = "WhiteOak Canyon & Cedar Run Trail"
        ht3.TrailDescription = "Get to know this 8.3-mile loop trail near Syria, Virginia. Generally considered a challenging route, it takes an average of 4 h 50 min to complete. This is a very popular area for backpacking and hiking, so you'll likely encounter other people while exploring. The best times to visit this trail are March through November. Dogs are welcome, but must be on a leash."
        ht3.TrailLength = "8.3"
        
        ht3.TrailAddress = "Shenandoah National Park"
        ht3.TrailDifficulty = "Hard"
        ht3.TrailElevation = "2329 ft."
        ht3.TrailRoute = "Loop"
        ht3.TrailTime = "7 hrs."
        ht3.TrailWebSite = "https://www.alltrails.com/trail/us/virginia/white-oak-canyon-and-cedar-run-trail-loop"
        ht3.TrailImage = "burkelake.jpg"
        HikingTrailArray.append(ht3)
        
        let ht4 = HikingTrail()
        ht4.TrailName = "Bull Run Lake Trail"
        ht4.TrailDescription = "Get to know this 8.1-mile out-and-back trail near Markleeville, California. Generally considered a moderately challenging route, it takes an average of 3 h 55 min to complete. This trail is great for backpacking, hiking, and horseback riding, and it's unlikely you'll encounter many other people while exploring. The best times to visit this trail are May through October. Dogs are welcome, but must be on a leash."
        ht4.TrailLength = "8.1"
        ht4.TrailImage = "wod.jpeg"
        ht4.TrailAddress = "Carson-iceberg Wilderness"
        ht4.TrailDifficulty = "Moderate"
        ht4.TrailElevation = "1512 ft."
        ht4.TrailRoute = "Out & back"
        ht4.TrailTime = "5 hrs."
        ht4.TrailWebSite = "https://www.alltrails.com/trail/us/california/bull-run-lake-trail"
        
        HikingTrailArray.append(ht4)
        
        let ht5 = HikingTrail()
        ht5.TrailName = "Raven Rocks"
        ht5.TrailDescription = "Check out this 5.7-mile out-and-back trail near Bluemont, Virginia. Generally considered a challenging route, it takes an average of 3 h 14 min to complete. This is a very popular area for backpacking, camping, and hiking, so you'll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. Dogs are welcome, but must be on a leash."
        ht5.TrailLength = "5.7"
        ht5.TrailImage = "ravensrock.jpg"
        ht5.TrailAddress = "Bluemont, Virginia"
        ht5.TrailDifficulty = "Easy"
        ht5.TrailElevation = "1535 ft"
        ht5.TrailRoute = "Out & back"
        ht5.TrailTime = "5 hrs."
        ht5.TrailWebSite = "https://www.alltrails.com/trail/us/virginia/raven-rocks-via-appalachian-trail"
        
        
        
        HikingTrailArray.append(ht5)
    }
    
    
    
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        imgTrailImage.alpha = 0
        lblAddress.alpha = 0
        lblTrailName.alpha = 0
        txtTrailDescription.alpha = 0
        scAreaOne.alpha = 0
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        UIView.animate(withDuration: 3, animations: {
            self.imgTrailImage.alpha = 1
            self.lblAddress.alpha = 1
            self.lblTrailName.alpha = 1
            self.txtTrailDescription.alpha = 1
            self.scAreaOne.alpha = 1

        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swFav.isOn = false
        InitilizeData()
        let soundUrl = URL(fileURLWithPath: Bundle.main.path(forResource:"cannon_fire", ofType:"wav")!)
        mySoundFile = try? AVAudioPlayer(contentsOf: soundUrl)
        
        setLabels()
        
        // Do any additional setup after loading the view.
    }


}

