#!/bin/bash

set -e

TF_MIN_VERSION=$1
AZURERM_PROVIDER_MIN_VERSION=$2
TF_MAX_VERSION=${3:-"10.0"}

version_lt() {
  test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1";
}

version_gt() {
  test "$(echo "$@" | tr " " "\n" | sort -rV | tail -n 1)" != "$1";
}

while IFS=$(printf '\t') read -r short_version full_version
do
  if version_lt "$short_version" "${TF_MIN_VERSION}";
  then
    continue
  fi
  if version_gt "$short_version" "$TF_MAX_VERSION";
  then
    continue
  fi

  if [[ $AZURERM_PROVIDER_MIN_VERSION == 1.* ]]; then
  AZURERM_VERSIONS="'$AZURERM_PROVIDER_MIN_VERSION', '2.0', '3.0'"
  TERRAFORM_VERSIONS+="'$full_version', "

  elif [[ $AZURERM_PROVIDER_MIN_VERSION == 2.* ]]; then
  AZURERM_VERSIONS="'2.0', '$AZURERM_PROVIDER_MIN_VERSION', '3.0'"
  TERRAFORM_VERSIONS+="'$full_version', "

  else
  AZURERM_VERSIONS="'3.0', '$AZURERM_PROVIDER_MIN_VERSION'"
  TERRAFORM_VERSIONS+="'$full_version', "

  fi
done < <(curl --silent https://releases.hashicorp.com/terraform/index.json | \
         jq -r '[.versions[] | {"version_short": ([.version | split(".") | .[0,1]] | join(".")), "revision": (.version | split(".") | .[2]  | split("-") | .[0] | tonumber), "version_full": .version}] | sort_by(.revision) | reverse | unique_by(.version_short)[] | [.version_short, .version_full] | @tsv')

TERRAFORM_VERSIONS=$(echo $TERRAFORM_VERSIONS | sed 's/.$//')
echo "TERRAFORM_VERSIONS=[$TERRAFORM_VERSIONS]" >> $GITHUB_OUTPUT

AZURERM_VERSIONS=$(echo $AZURERM_VERSIONS | tr ', ' '\n' | sort -u | tr '\n' ', ' | sed -e 's/^.//' -e 's/.$//')
echo "AZURERM_VERSIONS=[$AZURERM_VERSIONS]" >> $GITHUB_OUTPUT
