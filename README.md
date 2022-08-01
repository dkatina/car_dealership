# car_dealership

### SQL Project Build database to store the data of a car dealership

### Invoice

Invoice serves as the joining table between the customer, the salesman, and the car that is being purchased.   
Customer <-> Salesman Many:Many 1 Saleman can work with multiple peopl, One customer can buy a cars from different sales man.   
Salesman <-> Car 1:Many A salesman can sell many cars, but a car can be sold only once by a single salesman   
Customer <-> Car 1:Many A customer can buy many cars, but a car can be bought only once by a single customer   

Invoice is the record of every vehicle purchase, it has its own id, tells what car was bought, who bought it, who sold it and when it was sold.   
Using the foreign keys to look back into the salesman, car, and customer tables to get more info on each one.   

### Ticket - Ticket_Part - Ticket_mechanic

This junction is a little more involved

Customer <-> Ticket 1:many as One customer can service many cars, or the same car repeatedly.   
Ticket <-> Part many:many fascilitated by the ticket_part joinging table. Because one ticket can require multiple parts,    
and one part can be involved in multiple tickets.   
Part <-> Inventory 1:Many One part exist many times within the inventory (I added inventory ID's so I could delete a specific number of items   
when they were 'used' in a repair see the function car service to see what I mean).
Ticket <-> Mechanic Many:Many A single ticket can require multiple mechanics, A single mechanic can work on many tickets.   
This relationship is facilitated through the ticket_mechanic table which shows which mechanics worked on which tickets.   
Mechanics are also linked to the Ticket_part table, so each mechanic is credited for the parts they installed.

The reason the ticket_mechanic exists and the ticket_part table isn't soley used is when a car needs to be serviced, but no parts need to be used.

The ticket is the Final record of the a car that needs to be serviced, Ticket includes, the customer id, the VIN of the vehicle, the service description,   
and the date serviced. It also points to the parts used, and the mechanics that worked on it linked by the ticket_id.

## Functions

car_sale1 simulates the sale of a car and the creation of the invoice   

add_inventory allows us to put specific quantities of an item into our inventory reserves   

car_service takes in a ticket_id, part(if applicable), number of parts(if applicable), and a mechanic   
It references inventory to see if the parts are available, if so they are removed from the inventory   
and 'installed' on our vehicle by a specific mechanic all of which can then be referenced in the ticket_part table.   
If no parts are used, the mechanic that worked on the car still gets credit for their work as they're added to the ticket_mechanic table.   

create_ticket does just that, gets the customer_id, description of issue, and vehivle VIN and creates a ticket entry.

