h1. INSTALLATION

h2. PERL

h3. Required packages
* PERL

h4. Running
usage: main.pl [-h] list [list ...]

Combine lists of integers to produce a single list in strictly increasing order (sorted and unique).

Usage:
perl main.pl "1,2,2,3,5,9,11" "2,3,3,3,6"

positional arguments:
  list          comma separated integer list e.g. 1,2,3,4,5

optional arguments:
  -h, --help    show this help message and exit

h2. Python

h3. Required packages
* Python

h3. Running
usage: main.py [-h] list [list ...]

Combine lists of integers to produce a single list in strictly increasing order (sorted and unique).

Usage:
python main.py "1,2,2,3,5,9,11" "2,3,3,3,6"

positional arguments:
  list        comma separated integer list e.g. 1,2,3,4,5

optional arguments:
  -h, --help  show this help message and exit

h2. QBasic

h3. Required packages
* QB64

h3. Running
* Compile and run the source in the QB64 IDE
* First, it will ask how many lists will be collected
* Second, it will ask the list (space separated values)

h2. Python-Django

h3. Required packages
* Python
* Django
* pip
* virtualenv

h3. Running
* Inside morse_code/bin, there is a run.sh which will install all requirements

h2. Go-Revel

h3. Required packages
* Go
* Revel Framework

h3. Running
* Do a soft link "ln -s morse_code $GOPATH/src/morse_code"
* Run "revel run morse_code"
