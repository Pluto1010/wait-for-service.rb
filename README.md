# wait-for-service.rb
A small tool for waiting for a TCP service to become available. 

Supports waiting and a maximum retry count. 
Useful when linking Docker containers.

# Example
`$ ./wait-for-service.rb 127.0.0.1 8080 10 5 1.5`

./wait-for-service.rb [hostname.tld] [port] [max_retries] [initial_wait_seconds] [wait_factor (float)]


# Dependencies
Developed using ruby 2.4.1 but it should work with much older versions too.
It only uses the ruby socket module. There are no other dependencies.

# Exit codes
- 0 - Service available
- 1 - Max retries exhausted waiting for the service to get ready to work
