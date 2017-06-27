# Docker csvquote
A simple wrapper around dbro/csvquote.

# Usage

Pass contents of a file to the csvquote command:
`cat testdata.csv | docker run --rm -i csvquote`

Extract 2nd column from csv file:
`cat testdata.csv | docker run --rm -i csvquote | cut -d ',' -f 2`
