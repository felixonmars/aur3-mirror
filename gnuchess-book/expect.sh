set timeout -1
spawn gnuchess
expect "White (1) :" 
send "book add book_1.02.pgn \n"
expect "all done!"
send quit
