#!/bin/sh

set -e

su - tor -s/bin/sh -c "tor --hash-password 'moso'"
echo "HashedControlPassword $(su - tor -s/bin/sh -c \
                "tor --hash-password '00137300'")" >>/etc/torrc
tor -f /etc/torrc