# mangal
A tool for exploring data in Ruby

## Description

mangal is a simple scripting language to explore data. It currently
expects to explore data in a rails project.

It works by providing modules that can be chained together to provide
a pipeline for the data. Modules wrap short blocks of ruby that take a
previous result, do something to it, and return a new result.

Most modules are designed to work on arrays or hashes, and all results
are array-ified is necessary.

## Usage

Run this from your rails project with:

	rails runner /path/to/mangal/cli.rb

This provides you with a prompt where you type in chains of modules.

## Examples

Load the first three users

	> model user > first 3
	[#<User id: 1, ...>, #<User id: 2, ...>, #<User id: 3, ...>]

Extract the names of the first three users

	> model user > first 3 > attr name
	["Betty Person", "Bobby User", "Bertrand Human"]

Convert the first three users into a pairs of names and emails

	> model user > first 3 > join attr name, attr email
	[["Betty Person", "betty@person.com"], ["Bobby User", "bobby@user.com"], ["Bertrand Human", "berty@human.being"]]

Turn that data into a csv

	> model user > first 3 > join attr name, attr email > csv name, email
	name,email
	Betty Person,betty@person.com
	Bobby User,bobby@user.com
	Bertrand Human,berty@human.being

...and save it to a file

	> model user > first 3 > join attr name, attr email > csv name, email > out users.csv
	Saved output to /some/path/users.csv

## Acknowledgements

This tool was made possible by Layon. Basically, it was all his idea.
