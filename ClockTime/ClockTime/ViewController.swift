//
//  ViewController.swift
//  ClockTime
//
//  Created by Imran Juma on 2018-04-13.
//  Copyright © 2018 Imran Juma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Lable outlet added so it can be later changed
    @IBOutlet weak var lable: UILabel!
    
    //Outlet for our settings button so we can change the different atributes of the button such as for when we want to fade it out
    @IBOutlet weak var settingsButton: UIButton!

    //Another outlet for our settingsView, so we can also make it appear at times we want and put it away when the user does not want to change the settings
    @IBOutlet weak var settingsView: UIView!
    
    //This will allow us to modify the segment for the color color
    @IBOutlet weak var clockColorSeg: UISegmentedControl!
    
    // This will allow for us to modify the background color segment
    @IBOutlet weak var clockBackgroundSeg: UISegmentedControl!
    
    
    
    
    
    //Adding in varible so we can add different customization feautures for the user
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //update the timer as soon as the application has been loaded
        self.updateTimer()
        
        //Allow the time to increase every second
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        //By deault we are hiding the settings view from the user unless he requests it, and making sure the settings are also faded out
        settingsView.isHidden = true
        settingsButton.alpha = 0.25
        
        // Making the UI look alot better by adding some rounded edges to the View the higher the radius the better the curves
        // Making the application look alot better
        settingsView.layer.cornerRadius = 5
        settingsButton.layer.cornerRadius = 5
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Action for the different functions of the settings button that we are creating
    @IBAction func settingsButton(_ sender: Any) {
        
        // if the view is currently hidden then show the view to the user
        if settingsView.isHidden == true {
            
            // show the view to the user, and allow them to hide the settings if they dont want to change anything
            settingsView.isHidden = false
            settingsButton.setTitle("Hide Settings", for: UIControlState.normal)
            print("User Clicked To Show Settings")

            
            // Chaning the fading of the button
            settingsButton.alpha = 1.0
            
        } else {
            
            // if the settings view is not hidden allow them to show the settings, and then put it away after
            settingsView.isHidden = true
            settingsButton.setTitle("Show Settings", for: UIControlState.normal)
            print("User Clicked For Hide Settings")

            
            // Changing the fading of the button
            settingsButton.alpha = 0.25
        }
        
    }
    
    //Update the timer function whenever the function is triggered
    @objc func updateTimer() {
        
        // update the time when the function is called to the current user time
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        lable.text = timeFormatter.string(from: Date())
        print("Time Auto Update Completed")

        
    }
    
    // Function to update timer
    func upadteTimer() {
        
        //Creating the formation
        let timeFormatter = DateFormatter()
        
        //Showing the tyme style
        timeFormatter.timeStyle = .medium
        
        //Update the lable to show the ucrrent date for the user, this is local for wherever the user is
        lable.text = timeFormatter.string(from: Date())
        
    }
    
    //Actions for when they want to change the clock color
    @IBAction func clockColor(_ sender: Any) {
        // When the user selects a secition of our segment, then we will trigger the color to be changed to the selection that they have made in their series
        
        // Change the text color when the user clicks the first segIndex
        if (clockColorSeg.selectedSegmentIndex == 0 ) {
            lable.textColor = UIColor.white
            print("Seg 1 - Text Color Selected")
        }
        
        // Change the text color when the user clicks the second segIndex
        if (clockColorSeg.selectedSegmentIndex == 1 ) {
            lable.textColor = UIColor.black
            print("Seg 2 - Text Color Selected")
        }
        
        // Change the text color when the user clicks the third segIndex
        if (clockColorSeg.selectedSegmentIndex == 2 ) {
            lable.textColor = UIColor.red
            print("Seg 3 - Text Color Selected")
        }
        
        // Change the text color when the user clicks the fourth segIndex
        if (clockColorSeg.selectedSegmentIndex == 3 ) {
            lable.textColor = UIColor.green
            print("Seg 4 - Text Color Selected")
        }
    }
    
    //Actions for when the user wants to chnage the background color
    @IBAction func clockBackgroundColor(_ sender: Any) {
        // When the user selects a secition of our segment, then we will trigger the color to be changed to the selection that they have made in their series
        
        // Change the text color when the user clicks the first segIndex
        if (clockBackgroundSeg.selectedSegmentIndex == 0 ) {
            self.view.backgroundColor = UIColor.black
            print("Seg 1 - Background Color Selected")
        }
        
        // Change the text color when the user clicks the second segIndex
        if (clockBackgroundSeg.selectedSegmentIndex == 1 ) {
            self.view.backgroundColor = UIColor.white
            print("Seg 2 - Background Color Selected")
        }
        
        // Change the text color when the user clicks the third segIndex
        if (clockBackgroundSeg.selectedSegmentIndex == 2 ) {
            self.view.backgroundColor = UIColor.yellow
            print("Seg 3 - Background Color Selected")
        }
        
        // Change the text color when the user clicks the fourth segIndex
        if (clockBackgroundSeg.selectedSegmentIndex == 3 ) {
            self.view.backgroundColor = UIColor.blue
            print("Seg 4 - Background Color Selected")
        }
        
        
        

    }
    
    
    
    
    
}


