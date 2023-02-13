//
//  main.swift
//  Shiny
//
//  Created by Robert Stearn on 13/02/2023.
//

import Foundation

let args = CommandLine.arguments
let iterations = 10000

if args.count == 2 && args[1] == "help" {
    help()
} else if args.count < 3 {
    reject()
} else {
    let cleanArgs = sanitize(args)
    if cleanArgs != (0,[0]) {
        iterate(thru: cleanArgs.0, with: cleanArgs.1)
    }
}

private func help() {
    print("Instructions for using Shiny.\nShiny needs at least 2 pieces of data; a backlog size and list of historical throughput data.\n- The backlog size should be an integer greater than zero.\n- The through put should be a comma-seperated list of integers with a maximum length of 8 entries, ordered newest to oldest.\n- Shiny will accept larger size lists but only the first 8 entires will be used.\n- Shiny will accept less than 8 items however this will affect the accuracy of the forecast.")
}

private func reject() {
    print("No input data specified.")
}


private func sanitize(_ args: [String]) -> (Int,[Int]) {
    if let backlog = Int(args[1]) {
        let csv = args[2].components(separatedBy: ",")
        return(backlog,csv.map(){Int($0) ?? 0}) //TODO: Not safe enough
    }
    return (0,[0])
}

private func iterate(thru backlog:Int, with history: [Int]) -> Void {
    var results = [Int]()
    for _ in 0..<iterations { //1. for loop on iterations, counter = 0
        var thisBacklog = backlog
        var result:Int = 0
        while thisBacklog > 0 {
            //2. get random number from 0 < args[1].length
            let rando = Int.random(in: 0..<history.count)
            //3. get value, subtract from args[0], == 0?
            let value = history[rando]
            thisBacklog -= value
            //4. add 1 to counter
            result += 1
        }
        results.append(result)
    }
    let thing = iterations/100
    let fiftiethIndex = Int(thing * 50)
    let twentyFifthIndex = Int(thing * 25)
    let eightyFifthIndex = Int(thing * 85)
    let sortedResults = results.sorted {$0 < $1}
    print("25th Percentile: \(sortedResults[twentyFifthIndex])")
    print("50th Percentile: \(sortedResults[fiftiethIndex])")
    print("85th Percentile: \(sortedResults[eightyFifthIndex])")
}
