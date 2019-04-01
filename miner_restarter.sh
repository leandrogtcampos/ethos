#!/bin/bash

miner_hashes_raw="$(tail -10 /var/run/ethos/miner_hashes.file | sort -V | tail -1)";

IFS=', ' read -r -a hash_array <<< "$miner_hashes_raw"

min_hash=5;
i=0

while [ ! -z "${hash_array[i]%\.*}" ]; do

  if [[ "${hash_array[i]%\.*}" -lt $min_hash ]]; then

    echo "Restarting miner..."    
    /opt/ethos/bin/minestop
    
	i=100
  fi

  i=$(( $i + 1 ))
done
