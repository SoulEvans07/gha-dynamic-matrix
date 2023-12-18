#!/usr/bin/env bash
echo "filter: $AFFECTED"

REGIONAL=("voucher-fe" "leaflet-be")

# Filter elements in AFFECTED that are also in REGIONAL
regionalAffected=()
defaultAffected=()
for element in ${AFFECTED[@]}; do

  if [[ " ${REGIONAL[@]} " =~ "$element" ]]; then
    regionalAffected+=("$element")
  else
    defaultAffected+=("$element")
  fi
done

# Print the regionalAffected array
echo "regional: $regionalAffected"
echo "default: $defaultAffected"

echo ::set-output name=regional::${regionalAffected}
echo ::set-output name=default::${defaultAffected}