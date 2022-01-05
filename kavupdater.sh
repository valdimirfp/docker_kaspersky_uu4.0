#!/bin/bash

cd /opt/kuu
./uu-console.sh -u -r --acceptksn --accepteula  --acceptprivacypolicy > "/opt/logs/KS_update_LOG_$(date +"%F_%H:%M").txt"
#./uu-console.sh -r -s -u
#./uu-console.sh -r -u >> /home/kladmin/kavupdlog.txt
