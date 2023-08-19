//
//  TableViewController.swift
//  tableViewClassicalMusic
//
//  Created by Nuradil Serik on 19.08.2023.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayMusic = [Music(name: "Four seasons – winter: i", author: "Antonio Lucio Vivaldi", imageName: "vivaldi"),
                      Music(name: "Caprice 24", author: "Niccolò Paganini", imageName: "paganini"),
                      Music(name: "Lacrimosa", author: "Wolfgang Amadeus Mozart", imageName: "mozart2"),
                      Music(name: "Eine Kleine Nachtmusik", author: "Wolfgang Amadeus Mozart", imageName: "mozart"),
                      Music(name: "Moonlight Sonata", author: "Ludwig Van Beethoven", imageName: "beethoven"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayMusic.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let labelName = cell.viewWithTag(1) as! UILabel
        labelName.text = arrayMusic[indexPath.row].name
        let labelAuthor = cell.viewWithTag(2) as! UILabel
        labelAuthor.text = arrayMusic[indexPath.row].author
        let imageView = cell.viewWithTag(3) as! UIImageView
        imageView.image = UIImage(named: arrayMusic[indexPath.row].imageName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = storyboard?.instantiateViewController(withIdentifier: "detailedView") as! ViewController
        navigationController?.show(detailedVC, sender: self)
        
        detailedVC.music = arrayMusic[indexPath.row]
        
    }

    @IBAction func addMusic(_ sender: UIBarButtonItem) {
        
        arrayMusic.append(Music(name: "Name", author: "Author", imageName: "imagePlaceHolder"))
        tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayMusic.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
