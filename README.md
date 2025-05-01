Here’s a bash script that performs directory fuzzing using a wordlist for a given domain name. The script uses curl to send HTTP requests and checks for the status codes of the responses.

Save the script to a file, e.g. " fuzzer.sh "

Make it executable: chmod +x fuzzer.sh

Run the script with a domain and wordlist: ./directory_fuzzer.sh https://example.com wordlist.txt

Notes: Replace https://example.com with the domain you want to test.
       Replace wordlist.txt with the path to your wordlist file containing directory names (one per line).
       The script checks HTTP response codes and displays "FOUND" for status 200 and "NOT FOUND" for others.

Follow me on instagram " @zeroday454 " for cyber security contents.
