#!/bin/bash -e


echo "Running argcod: ${*}"

exec argocd "$@"
