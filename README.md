# BitCoin
 
Find the working code in src/Bitcoin.
### To execute the system:
In local terminal:
1. Build the entire project in an IDE with the ERLANG plugin installed (or)
2. c(server).
c(mining).
server:createActors(4). %%here 4 denotes the number of leading zeros in bitcoin
To run remote nodes: Create a server node using:
a. In terminal: erl -name server@ipaddr -setcookie CookieName
b. Start server node: server:start(4). Create a client node using:
a. In terminal: erl -name client@ipaddr -setcookie CookieName b. Send a msg to server node: client:ping(‘server@ipaddr’).
Now, observe the output of client actors in the server terminal.
