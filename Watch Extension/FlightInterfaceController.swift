//
//  FlightInterfaceController.swift
//  Watch Extension
//
//  Created by Jun Dang on 11/23/19.
//  Copyright © 2019 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class FlightInterfaceController: WKInterfaceController {

  @IBOutlet var flightLabel: WKInterfaceLabel!
    
  @IBOutlet var routeLabel: WKInterfaceLabel!
    
  @IBOutlet var boardingLabel: WKInterfaceLabel!
    
  @IBOutlet var boardTimeLabel: WKInterfaceLabel!
    
  @IBOutlet var statusLabel: WKInterfaceLabel!
    
  @IBOutlet var gateLabel: WKInterfaceLabel!
    
  @IBOutlet var seatLabel: WKInterfaceLabel!

  var flight: Flight? {
    didSet {
      guard let flight = flight else { return }
      
      flightLabel.setText("Flight \(flight.shortNumber)")
      routeLabel.setText(flight.route)
      boardingLabel.setText("\(flight.number) Boards")
      boardTimeLabel.setText(flight.boardsAt)
      
      if flight.onSchedule {
        statusLabel.setText("On Time")
      } else {
        statusLabel.setText("Delayed")
        statusLabel.setTextColor(.red)
      }
      gateLabel.setText("Gate \(flight.gate)")
      gateLabel.setText("Seat \(flight.seat)")
    }
  }
  
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        flight = Flight.allFlights().first
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
