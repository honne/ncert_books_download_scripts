#!/bin/bash
awk -F '|' '{printf("./ncert_books_download.sh -c %s -s %s -b %s -l %s\n", $1, $2, $3, $4);}'   < urls  >download_all.sh
