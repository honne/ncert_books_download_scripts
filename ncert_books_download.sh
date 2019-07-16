#!/bin/bash
pushd $(dirname "${0}") > /dev/null
MY_BIN=$(pwd -L)
popd > /dev/null
MY_HOME=${MY_BIN%%/bin}

usage() { echo "Usage: $0 -c <class> -s <subject> -b <book_name> -l <link> " 1>&2; exit 1; }

while getopts c:s:b:l: opt
do
  case "$opt" in
    c) CLASS="$OPTARG";;
    s) SUBJECT="$OPTARG";;
    b) BOOK="$OPTARG";;
    l) LINK="$OPTARG";;
   esac
done

if [ -z "${CLASS}" ] || [ -z "${SUBJECT}" ] || [ -z "${BOOK}" ] || [ -z "${LINK}" ]; then
    usage
fi

/bin/mkdir -p ${CLASS}/${SUBJECT}/${BOOK}

echo "Downloading ${CLASS}:${SUBJECT}:${BOOK} -> ${LINK}"
wget -q -O a.zip ${LINK}
unzip a.zip -d ${CLASS}/${SUBJECT}/${BOOK}
rm -f a.zip
