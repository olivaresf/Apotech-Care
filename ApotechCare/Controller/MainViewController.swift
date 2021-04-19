//
//  ViewController.swift
//  ApotechCare
//
//  Created by Muhammad Harviando on 01/04/21.
//  Copyright © 2021 Muhammad Harviando. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //Property
    @IBOutlet weak var medicineCollectionView: UICollectionView!
    @IBOutlet weak var categoryOneCollectionView: UICollectionView!
    @IBOutlet weak var categoryTwoCollectionView: UICollectionView!
    @IBOutlet weak var categoryThreeCollectionView: UICollectionView!
    
    let medicineModel = MedicineModel()
    let categoryModel = CategoryModel()
    
    var indexPathCollection: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.definesPresentationContext = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by name"
        self.navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        //        DispatchQueue.main.asyncAfter(deadline: .now()) {
        //            searchController.isActive = true
        //        }
        
    }
}


// MARK: - UISearchBar
extension MainViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Pressed")
    }
    
}



//MARK: - UICollectionView

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.medicineCollectionView {
            return medicineModel.medicine.count
        }
        
        if collectionView == self.categoryOneCollectionView {
            return categoryModel.category.count - 6
        }
        
        if collectionView == self.categoryTwoCollectionView {
            return categoryModel.category.count - 6
        }
        
        if collectionView == self.categoryThreeCollectionView {
            return categoryModel.category.count - 6
        }
        
        return 1
        
    }
    
    func setupCategoryCell(collectionView: UICollectionView,
                           indexPath: IndexPath,
                           imageName: String,
                           mainText: String,
                           secondaryText: String?) -> MainViewControllerCell {
        
        let cellCategory = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCellIdentifier",
                                                              for: indexPath) as! MainViewControllerCell
                
        let image = UIImage(named: "\(imageName)")
        cellCategory.imageView.image = image
        cellCategory.mainTextLabel.text = mainText
        cellCategory.secondaryTextLabel?.text = secondaryText
        
        return cellCategory
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == medicineCollectionView {
            let index = medicineModel.medicine[indexPath.row]
            return setupCategoryCell(collectionView: medicineCollectionView,
                                     indexPath: indexPath,
                                     imageName: index.image,
                                     mainText: index.medicine,
                                     secondaryText: index.price)
        }
        
        let offset: Int
        if collectionView == categoryOneCollectionView {
            offset = 0
        } else if collectionView == categoryTwoCollectionView {
            offset = 3
        } else if collectionView == categoryThreeCollectionView {
            offset = 6
        } else {
            offset = 0
        }
       
        let index = categoryModel.category[indexPath.row + offset]
        return setupCategoryCell(collectionView: collectionView,
                                 indexPath: indexPath,
                                 imageName: index.image,
                                 mainText: index.name,
                                 secondaryText: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.medicineCollectionView {
            
            switch indexPath.row {
            case 0:
                performScreenPresentation(index: 0)
            case 1:
                performScreenPresentation(index: 1)
            case 2:
                performScreenPresentation(index: 2)
            case 3:
                performScreenPresentation(index: 3)
            case 4:
                performScreenPresentation(index: 4)
            case 5:
                performScreenPresentation(index: 5)
            case 6:
                performScreenPresentation(index: 6)
            case 7:
                performScreenPresentation(index: 7)
            case 8:
                performScreenPresentation(index: 8)
            case 9:
                performScreenPresentation(index: 9)
            case 10:
                performScreenPresentation(index: 10)
            default:
                print("Default Item")
            }
            
            
            
        }
        
        if collectionView == self.categoryOneCollectionView {
            
            switch indexPath.row {
            case 0:
                performScreenPresentationOne(index: 0)
            case 1:
                performScreenPresentationOne(index: 0)
            default:
            print("Default Item")
            }
            
    
            
        }
        
        if collectionView == self.categoryTwoCollectionView {
            
    
            
        }
        
        if collectionView == self.categoryThreeCollectionView {
            
    
            
        }
        
        
        
    }
    
    func performScreenPresentation(index: Int) {
        
        switch index {
        case 0:
            prepareData(index)
        case 1:
            prepareData(index)
        case 2:
            prepareData(index)
        case 3:
            prepareData(index)
        case 4:
            prepareData(index)
        case 5:
            prepareData(index)
        case 6:
            prepareData(index)
        case 7:
            prepareData(index)
        case 8:
            prepareData(index)
        case 9:
            prepareData(index)
        case 10:
            prepareData(index)
        default:
            print("Default Item")
        }
            
        
    }
    
    
    func performScreenPresentationOne(index: Int) {
        switch index {
        case 0:
            prepareDataOne(index)
        case 1:
            prepareDataOne(index)
        default:
            print("Default Item")
        }
    }
    
    func prepareData(_ index : Int) {
        let indexPath = medicineModel.medicine[index]
        let image = UIImage(named: "\(indexPath.image)")
        
        let medicineVC = storyboard?.instantiateViewController(identifier: "medicineViewController") as! MedicineViewController
        medicineVC.title = indexPath.medicine
        medicineVC.medicineImageViewData = image
        medicineVC.apotechLabelData = indexPath.apotek
        medicineVC.medicineSummaryData = indexPath.medicineSummary
        medicineVC.priceLabelData = indexPath.price
        medicineVC.medicineDescriptionData = indexPath.description
        medicineVC.imageString = indexPath.image
        self.navigationController?.pushViewController(medicineVC, animated: true)
    }
    
    
    func prepareDataOne(_ index : Int) {
        let categoryVC = storyboard?.instantiateViewController(identifier: "categoryViewController") as! CategoryViewController
        categoryVC.index = index
        self.navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    
}
