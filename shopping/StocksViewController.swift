//
//  StocksViewController.swift
//  shopping
//
//  Created by 池田光里 on 2021/09/02.
//  Edit By 林　理人
//

import UIKit

class StocksViewController: UITableViewController {

    class Stock {
        var name : String
        var count : Int
        
        init(name : String, count : Int = 1){
            self.name = name
            self.count = count
        }
    }
    var stockArray : [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //cellの数を指定
        //stockArrayの数だけ返す
        return stockArray.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //sectionの数
        return 1
    }
    //cellの構築をする
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath)
        
        cell.textLabel?.text = stockArray[indexPath.row]
        
        return cell
    }
    
    //＋ボタンが押された時にポップアップ表示
    @IBAction func AddButton(_ sender: Any) {
        
        var textFieldForStock = UITextField()
        let alertForAdd = UIAlertController(title: "アイテムを追加", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "リストに追加", style: .default) { (action) in
            let newStock : Stock = Stock(name : textFieldForStock.text!)
//            self.stockArray.append(newStock)
            self.tableView.reloadData()
        }

        alertForAdd.addTextField { (alertTextField) in
            alertTextField.placeholder = "NEWアイテム"
            textFieldForStock = alertTextField
        }

        alertForAdd.addAction(action)
        present(alertForAdd, animated: true, completion: nil)
    }
    
    


    //キーボードのreturnキーが押された時に
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        
//        stockArray.append(textField.text!)
//        textField.resignFirstResponder() //キーボードを閉じる
//        textField.text = "" //テキストをからにする
//        tableView.reloadData() //今までの行程(~セルを返す)をもう一度行い返す
//        
//        return true
//    }
    


}
