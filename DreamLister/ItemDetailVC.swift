//
//  ItemDetailVC.swift
//  DreamLister
//
//  Created by Patcharapon Joksamut on 1/27/2560 BE.
//  Copyright © 2560 Patcharapon Joksamut. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    @IBOutlet weak var imageDisplay: UIImageView!
    
    
    var stores = [Store]()
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        getStores()
        
        if itemToEdit != nil {
            loadItemData()
        }
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //update when selected
    }
    
    func getStores(){
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do{
            
            try self.stores = context.fetch(fetchRequest)

            if stores.count == 0 {
                        let store1 = Store(context: context)
                        store1.name = "Ebay"
                        let store2 = Store(context: context)
                        store2.name = "Amazon"
                        let store3 = Store(context: context)
                        store3.name = "Lazada"
                        let store4 = Store(context: context)
                        store4.name = "Best Buy"
                        let store5 = Store(context: context)
                        store5.name = "Siam Paragon"
                        let store6 = Store(context: context)
                        store6.name = "Others"
                        
                        ad.saveContext()
                
                        getStores()

            }
            
            
            self.storePicker.reloadAllComponents()
            
        } catch {
            
            //Handle Error
            
        }
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
        var item: Item
        let picture = Image(context: context)
        picture.image = imageDisplay.image
        
        
        if itemToEdit == nil{
            item = Item(context: context)
        } else {
            item = itemToEdit!
        }
        
        item.toImage = picture
        
        if let title = titleField.text{
            item.title = title
        }
        if let price = priceField.text{
            item.price = (price as NSString).doubleValue
        }
        if let detail = detailsField.text{
            item.details = detail
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
        
    }
    
    func loadItemData() {
        
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            imageDisplay.image = item.toImage?.image as? UIImage
            storePicker.selectRow(stores.index(of: item.toStore!)!, inComponent: 0, animated: false)
            
        }
        
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func imagePickerPressed(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageDisplay.image = img
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
}


















