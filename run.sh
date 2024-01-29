#!/usr/bin/env sh

AUTOSSH="autossh"

# AWS Aurora PG RDS proxy SSH tunnel
if command -v "${AUTOSSH}" &> /dev/null && test -n "${AWS_AURORA_PG_RDS_DPNK_PROXY_REMOTE_HOST}";
then
    "${AUTOSSH}" -o ServerAliveInterval=20 \
                 -o StrictHostKeyChecking=accept-new \
                 -i "${HOME}/.ssh_keys/aurora-rds-pg-dpnk-db-proxy.pem" \
                 -M 0 \
                 -N \
                 -L "0.0.0.0:${AWS_AURORA_PG_RDS_DPNK_PROXY_LOCALHOST_PORT-5432}":"${AWS_AURORA_PG_RDS_DPNK_PROXY_REMOTE_HOST}":"${AWS_AURORA_PG_RDS_DPNK_PROXY_REMOTE_HOST_PORT-5432}" \
                 "${AWS_E2C_AURORA_PG_RDS_DPNK_PROXY_REMOTE_USERNAME_WITH_HOST}"
fi
