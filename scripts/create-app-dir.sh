#!/usr/bin/env bash

# optional shellcheck options
# shellcheck enable=add-default-case
# shellcheck enable=avoid-nullary-conditions
# shellcheck enable=check-unassigned-uppercase
# shellcheck enable=deprecate-which
# shellcheck enable=quote-safe-variables
# shellcheck enable=require-variable-braces


SERVICE_NAME="${1?error}"; declare -r SERVICE_NAME
SUBDIR_NAMES="${2?error}"; declare -r SUBDIR_NAMES

# ENV SETTINGS ##########
set -e                      # exit all shells if script fails
set -u                      # exit script if uninitialized variable is used
set -o pipefail             # exit script if anything fails in pipe
shopt -s failglob           # fail on regex expansion fail
shopt -s nullglob           # enables recursive globbing
IFS=$'\n\t'



declare -r SERVICES_DIRPATH='/volume2/docker-data/services'

function run {
  local -r cmd="${1?error}"
  ssh -t nas "${cmd?error}"':; exit ${?};' || exit 1
}


function main {
  local -r service_dirpath="${SERVICES_DIRPATH?error}/${SERVICE_NAME?error}"
  local -r app_data_dirpath="/app-data"
  IFS=',' read -r -a subdir_names <<< "${SUBDIR_NAMES?error}"


  local new_path=''
  local cmd=''
  for subdir_name in "${subdir_names[@]}"; do
    new_path="/${subdir_name?error}"
    cmd="${cmd?error}"':; sudo mkdir -p '"'${new_path?error}';"
  done


  cmd="${cmd?error}"' :; sudo chown --recursive 911:1001 '"''"
  cmd="${cmd?error}"'; sudo chmod --recursive 755 '"'';"


  echo "EXECUTING: "
  run "${cmd?error}"


  # echo "CREATING: "

#   send 'mkdir -p'
#   ssh nas <<'ENDSSH'
#     readonly SERVICE_DIR='/var/services/homes/freon/docker-data/services'
#     cd "" || exit 1
#
#     mkdir -p "/${SERVICE_NAME"}
#     if [[ "$(pwd)" == "{SERVICE_DIR}" ]]; then
#
#
#     else
#       echo "ERROR | pwd: $(pwd) but expected "
#       exit 1
#     fi
#
#   ENDSSH


}
main
