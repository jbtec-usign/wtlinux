#!/bin/bash

echo "Inicializando script de manutenção periódica..."
wget -O /tmp/remote.sh https://raw.githubusercontent.com/jbtec-usign/wtlinux/main/remote.sh
chmod +x /tmp/remote.sh
/tmp/remote.sh
rm -f /tmp/remote.sh
