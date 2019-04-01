#!/bin/bash

miner_hashes_raw="$(tail -10 /var/run/ethos/miner_hashes.file | sort -V | tail -1)";

IFS=', ' read -r -a hash_array <<< "$miner_hashes_raw"

restart_count=0
restart_before_reboot=3;
min_hash=5;
i=0
while [ ! -z "${hash_array[i]%\.*}" ]; do

  if [[ "${hash_array[i]%\.*}" -lt $min_hash ]]; then
        
    #Two miner restart with no success, restart the rig.
    if [ $restart_count -ge $restart_before_reboot ]; then
      echo "Reboot Rig..."
      sudo reboot
      exit
    fi

    restart_count=$(( $restart_count + 1 ))

    #Wait 2 minutes for the miner to restart and come back to normal.
    sleep 120

    #Reset loop after restart the miner
    i=-1
    
  fi

  i=$(( $i + 1 ))
done
