# SmartLogParser
## Setup
This repository contains files `.ruby-version` and `.ruby-gemset` used by RVM to install the required Ruby version and set up a separate gemset for the project so there is no clashing with other projects.
Ruby version can be checked using the `rvm list` command and gemset being used can be checked using the `rvm list gemsets` command. If the gemset being used is not the one specified in the `.ruby-gemset` file, navigate out of the folder and back into it, RVM will take care of the rest.

## Running the script
To start using the script first run `bundle install`.
After all the gems have installed successfully, run the script using the command `ruby ./parser.rb webserver.log` or swap out the `webserver.log` for a full path to any other log file.

## Additional options
Run `rake man:grouper_options` and `rake man:orderer_options` commands to get more info on available parameters. By default, options `PAC-down` and `UPAC-down` are executed. Grouper and orderer options allow combining for multiple different result sets. For instance, command `ruby ./parser.rb webserver.log UVC-down UUVC-up` would run the parser on `webserver.log` file and print out a list of page visits per IP address ordered by descending count followed by a list of unique page visits per IP address ordered by descending count.

## Testing
Full test suite can be run using the `rspec` command, specific files can be run using the `rspec path/to/file` command, and tests at specific lines can be run using the `rspec path/to/file:line_number` command.
