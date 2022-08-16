#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: package_influxdb_condor.sh VERSION"
  exit 1
fi

fpm \
  --input-type dir \
  --output-type rpm \
  --name tier1-condor-telegraf-metrics \
  --version $1 \
  --iteration 1 \
  --architecture noarch \
  --prefix '/usr/bin/' \
  --vendor 'Science and Technology Facilties Council' \
  --url 'https://github.com/stfc/telegraf-scripts' \
  --description 'Scripts used to monitor HTCondor at RAL' \
  --depends 'python3' \
  metrics-influxdb-condor* metrics-influxdb-htcondor-groups
