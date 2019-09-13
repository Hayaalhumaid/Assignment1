//
//  DetailViewController.swift
//  Assignment1
//
//  Created by Haya Alhumaid on 9/13/19.
//  Copyright © 2019 HayaAlhumaid. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var selectedMovie: Movie?
    
    @IBOutlet weak var colorView: UISlider!
    
    @IBOutlet weak var Description: UITextView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let colors = ["Horror","Drama","Romance","Comedy"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print(self.selectedMovie!.title)
        // Do any additional setup after loading the view.
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Delegate Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
