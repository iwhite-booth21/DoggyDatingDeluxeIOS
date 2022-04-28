//
//  ChatViewController.swift
//  DoggyDatingDeluxeIOS
//
//  Created by Isaiah White-Booth on 4/27/22.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
       
    @IBOutlet weak var messageTextField: UITextField!
    
    var messages = [PFObject]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell") as! ChatTableViewCell
        
        let message = messages[indexPath.row]
        
        // let user = message["author"] as! PFUser
        print(message)
        // cell.username.text = user.username
        cell.chatmessage.text = message["message"] as? String
        
        return cell
        
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSendMessage(_ sender: Any) {
        let message = PFObject(className: "Message")
        message["message"] = messageTextField.text!
        message["author"] = PFUser.current()!
        
        message.saveInBackground{(success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("Message Saved In Parse")
            } else {
                print("Error")
            }
        }
    }
        
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
            
        let query = PFQuery(className: "Message")
        query.includeKey("author")
        query.limit = 10
        
        query.findObjectsInBackground{(messages, error) in
            if messages != nil{
                self.messages = messages!
                self.tableView.reloadData()
            }
        }
        
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

 
