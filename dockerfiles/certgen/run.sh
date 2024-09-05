#!/usr/bin/env sh

# optional shellcheck options
# shellcheck enable=add-default-case
# shellcheck enable=avoid-nullary-conditions
# shellcheck enable=check-unassigned-uppercase
# shellcheck enable=deprecate-which
# shellcheck enable=quote-safe-variables
# shellcheck enable=require-variable-braces

readonly CERTIFICATES_DIR="${CERTIFICATES_DIR:-'/certs'}"
readonly TAILSCALE_HOST="${TAILSCALE_HOST:-'minio.stonecat-shark.ts.net'}"

set -e            # exit all shells if script fails
set -u            # exit script if uninitialized variable is used
set -o pipefail   # exit script if anything fails in pipe
IFS=$'\n\t'       # Internal Field Separator

readonly PUBLIC_KEY_PATH="${CERTIFICATES_DIR}/public.crt"
readonly PRIVATE_KEY_PATH="${CERTIFICATES_DIR}/private.key"

function doit() {
  ( cd "${CERTIFICATES_DIR}" || exit 1
    certgen -host "localhost,${TAILSCALE_HOST}"
  )
}

function main() {
  # this could be improved to account for one file existing but not the other
  if [[ -f "${PRIVATE_KEY_PATH}" && -f "${PUBLIC_KEY_PATH}" ]]; then
    echo "CERTIFICATES ALREADY EXIST AT: ${CERTIFICATES_DIR}"
  else
    echo "CREATING CERTIFICATES AT: ${CERTIFICATES_DIR}"
    doit
  fi
}
main
