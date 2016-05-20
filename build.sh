#!/bin/bash

if [ $# != 2 ]; then
    (
        echo "Usage: $0 atlas-username"
        echo
        echo "Example: $0 matiashf"
    )
    #exit 1
fi

set -ex

if vagrant box list | grep "^ubuntu/xenial64" >/dev/null; then
    vagrant box outdated
else
    vagrant box add ubuntu/xenial64
fi
box_version=$(vagrant box list | grep "^ubuntu/xenial64" | sed -r 's/^.*, ([0-9\.]+)\)$/\1/')

vagrant up
vagrant box repackage ubuntu/xenial64 virtualbox "$box_version"

test -f package.box
mv -f package.box ubuntu-xenial64-virtualbox-guest-"$box_version".box

vagrant destroy --force
