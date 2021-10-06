#! /bin/bash
#Author : ARMS
#variables
day=$(date +%A)
dom=$1
greetings()
{
echo -e "Welcome $USER! Today is $day.\nYou are using $SHELL shell for script execution."
}
#Enumerating records
dns_enum()
{
for rec in A AAAA CNAME MX TXT; do
	echo "$rec record of $dom "
	dig $dom $rec +short
	echo "________________"
done
}

file_enum()
{
while read domain; do
	echo $domain
	for rec in A AAAA CNAME MX TXT; do
		echo "$rec record of $dom "
	    dig $dom $rec +short
	    echo "===================="
		done
 echo "++++++++++++++++++++++++++++++ $domain Completed+++++++++++++++++++++++++++++++++"
done < file.txt
}

#main script
if [[ -z $dom ]]; then
#[[ $# -eq 0 ]] it is also possible
	echo "Invalid syntax. Please provide domain name"
	echo "Eg : $0 example.com"
else
	greetings
	dns_enum
fi