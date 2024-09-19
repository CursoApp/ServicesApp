//
//  RootViewControler.swift
//  ServicesApp
//
//  Created by Mañanas on 19/9/24.
//

import SwiftUI

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Disable back button
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide navigation bar
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show navigation bar
        self.navigationController?.isNavigationBarHidden = false
    }

}

/*struct RootViewControler: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RootViewControler()
}*/
