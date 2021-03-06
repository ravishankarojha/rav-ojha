#!/bin/bash

d=$(dirname "$0")
[ !  -z  "$d"  ] &&  d="$d/"

export CLASSPATH_FILE='target/cp.txt'
mvn compile dependency:build-classpath -Dmdep.outputFile=${CLASSPATH_FILE} > /dev/null 2>&1
groovy -cp "target/classes:$(cat $CLASSPATH_FILE)" "${d}createDocu" "${@}"
