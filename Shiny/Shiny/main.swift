//
//  main.swift
//  Shiny
//
//  Created by Robert Stearn on 13/02/2023.
//

import Foundation

let args = CommandLine.arguments
print("You sent me \(args.count) thing\(args.count == 1 ? "" : "s")")

if args.count == 2 && args[1] == "help" {
    print("Instructions for using Shiny.\nShiny needs at least 2 pieces of data; a backlog size and list of historical throughput data.\n- The backlog size should be an integer greater than zero.\n- The through put should be a comma-seperated list of integers with a maximum length of 8 entries, ordered newest to oldest.\n- Shiny will accept larger size lists but only the first 8 entires will be used.\n- Shiny will accept less than 8 items however this will affect the accuracy of the forecast.")
} else if args.count < 3 {
    print("No input data specified.")
}
