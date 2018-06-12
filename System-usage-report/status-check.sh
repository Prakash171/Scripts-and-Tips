#!/bin/bash
touch /path/to/save/Status-Reports/IP-$1.txt
echo "######################################################################" >> /path/to/save/Status-Reports/IP-$1.txt
echo "############### My-VM-$1-System-Report #####################" >> /path/to/save/Status-Reports/IP-$1.txt
echo "######################################################################" >> /path/to/save/Status-Reports/IP-$1.txt
echo "" >> /path/to/save/Status-Reports/IP-$1.txt
ssh -i "path/to/key.pem" -T <user-name>@$1 < check.sh >> /path/to/save/Status-Reports/IP-$1.txt
done

