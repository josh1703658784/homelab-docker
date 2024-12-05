#!/usr/bin/env bash

# optional shellcheck options
# shellcheck enable=add-default-case
# shellcheck enable=avoid-nullary-conditions
# shellcheck enable=check-unassigned-uppercase
# shellcheck enable=deprecate-which
# shellcheck enable=quote-safe-variables
# shellcheck enable=require-variable-braces


NEW_SERVICE="${1?error}"; declare -r NEW_SERVICE
NEW_SERVICE_DIRS="${2?error}"; declare -r NEW_SERVICE_DIRS

# ENV SETTINGS ##########
set -e                      # exit all shells if script fails
set -u                      # exit script if uninitialized variable is used
set -o pipefail             # exit script if anything fails in pipe
shopt -s failglob           # fail on regex expansion fail
shopt -s nullglob           # enables recursive globbing
IFS=$'\n\t'



declare -r ROOT_DIRPATH='/volume2/docker-data/services'

function run {
  local -r cmd="${1?error}"
  ssh -t nas "${cmd?error}"':; exit "${?}";' || exit 1
}


function main {
  local -r new_service_dirpath="${ROOT_DIRPATH?error}/${NEW_SERVICE?error}"
  local -r new_service_app_data="${new_service_dirpath?error}/app-data"

  IFS=',' read -ra new_service_dirs <<< "${NEW_SERVICE_DIRS?error}"

  local new_path=''
  local cmd=''

  for dir in "${new_service_dirs[@]}"; do
    new_path="${new_service_app_data?error}/${dir?error}"
    cmd="${cmd?error}"'sudo mkdir -p '"'${new_path?error}';"
  done


  cmd="${cmd?error}"'sudo chown --recursive 911:1001 '"'${new_service_dirpath}'"';'
  cmd="${cmd?error}"'sudo chmod --recursive 755 '"'${new_service_dirpath}'"';'

  # cmd="sudo sh -c '${cmd}'"

  echo "EXECUTING: ${cmd}"
  run "${cmd?error}"
}
main
