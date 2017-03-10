#!/bin/bash

echo 'Author, Title, CreationDate' >> $2
for file in $1/*.pdf
do
	c0=$(echo "${file}" | rev | cut -d '/' -f 1 | rev)
	c1=$(pdfinfo "${file}" | grep -i 'Author' | cut -f 2 -d ':' | sed -e 's/^[[:space:]]*//')
	c2=$(pdfinfo "${file}" | grep -i 'Title' | cut -f 2 -d ':' | sed -e 's/^[[:space:]]*//')
	c3=$(pdfinfo "${file}" | grep -i 'CreationDate' | cut -f 2 -d ':' | sed -e 's/^[[:space:]]*//')

	echo "$c0, $c1 , $c2 , $c3" >> $2
done
