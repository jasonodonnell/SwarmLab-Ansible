#!/bin/bash

set -u

if [[ -f ./keys/id_rsa ]]
then
    rm -f ./keys/id_rsa
    rm -f ./keys/id_rsa.pub
fi

ssh-keygen -b 2048 -t rsa -f ./keys/id_rsa -q -N ""
chmod 400 ./keys/id_rsa*

exit 0
