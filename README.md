#Shiny
Shiny is a command-line tool written in Swift. It's presented an Xcode project which is downloadable from the [Mac App Store](https://apps.apple.com/gb/app/xcode/id497799835?mt=12) or [Apple's Developer Site](developer.apple.com).
It is also compilable from the command line using Xcode Command Line tools.

Shiny aims to provide a proof of concept for a tool to use Monte Carlo simulation in forecasting delivery of work. 
It operates initially on two pieces of data; the amount of tasks to be completed and the history of delivery for similar sized tasks.
The 'units' of delivery and time are up to the user, as long as the backlog and delivery history concern themselves with the same things.

For example:
A company needs to build `100` cars and the they have historically delivered the following amount of cars per week: `2,10,8,7,3,5`. This uses the came unit, cars, in the backlog and the throughput history.


##Instructions for using Shiny.

Shiny needs at least 2 pieces of data; a backlog size and list of historical throughput data.
The backlog size should be an integer greater than zero.
The throughput should be a comma-seperated list of integers with a maximum length of 8 entries, ordered newest to oldest.
Shiny will accept larger size lists but only the first 8 entires will be used.
Shiny will accept less than 8 items however this will affect the accuracy of the forecast.

###Syntax

Example `shiny 10 2,3,5,1`
Translation  `shiny <backlog_size> <comma_separated_delivery_history>`

###Output

Currently the tool, given correct input values will out the forecast chance of the backlog being delivered as a risk indicator, showing the time period in terms of the 25th, 50th and 85 percentile likelihood of the complete backlog being achieved like this:
`25th Percentile: 3
50th Percentile: 4
85th Percentile: 5`

The number being the time unit referenced in the throughput data.

##Todo
This is a basic implementation so far, the next set of features will be aiming to provide boundaries of uncertainty for growth of the scope and risk factors to the delivery. 
