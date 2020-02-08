# SmartLogParser
## Setup
This repository contains file `.ruby-version` used by RVM to install the required Ruby version. RVM also uses file `.ruby-gemset` to set up a separate gemset for the project so there is no clashing with other projects. Adding this file locally is strongly recommended. After adding it, navigate out of the current folder and back in to allow RVM to create the gemset.
Ruby version can be checked using the `rvm list` command and gemset being used can be checked using the `rvm list gemsets` command.

## Running the script
To start using the script first run `bundle install`.
After all the gems have installed successfully, run the script using the command `ruby ./parser.rb webserver.log` or swap out the `webserver.log` for a full path to any other log file.

## Additional options
Run `rake man:grouper_options` and `rake man:orderer_options` commands to get more info on available parameters. By default, options `PAC-down` and `UPAC-down` are executed. Grouper and orderer options allow combining for multiple different result sets. For instance, command `ruby ./parser.rb webserver.log UVC-down UUVC-up` would run the parser on `webserver.log` file and print out a list of page visits per IP address ordered by descending count followed by a list of unique page visits per IP address ordered by descending count.

## Testing
Full test suite can be run using the `rspec` command, specific files can be run using the `rspec path/to/file` command, and tests at specific lines can be run using the `rspec path/to/file:line_number` command.
Test coverage can be found in `coverage` folder of the project after running the tests for the first time.
