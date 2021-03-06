#!/bin/bash
#conceptually the same as install_if_needed.sh, but for debian/ubuntu

install_if_absent()
{
    [ $# -eq 0 ] && {
	echo "usage: install_if_absent <package0> [package1] [...]">&2
	return 1
    }
    while [ -n "$1" ]; do
	dpkg -L $1 &>/dev/null || apt-get -y install $1
	shift
    done
}

# example usage: install_if_absent ansible links openconnect vpnc
