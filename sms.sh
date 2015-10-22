#!/usr/bin/expect -f

set line 	[lindex $argv 0]
set l		[lindex $argv 1]
set p 		[lindex $argv 2]
set msg		[lindex $argv 3]
set phonenumber "test_num"
set formattedtexttosend "Your phone was hacked. :-P"

spawn ssh $l@$line
expect "Password:"
send "$p\n"
expect { 
		"Password:" {puts \ninvalid\ password\ or\ login\n; exit} 
		"*>"
}	
	send "telnet 158.124.254.123 4444\n"
	send "PAGE $phonenumber\r"
	send "DATA\r"
	send "$formattedtexttosend,Harder_flag:XJrr8kWwLXNQ8MFZ\r.\r"
	send "SEND\r"
	send "QUIT\r"
