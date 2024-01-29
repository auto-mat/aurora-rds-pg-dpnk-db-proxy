# K8 aurora-rds-pg-dpnk-db-proxy Docker image

### Usage
K8 aurora-rds-pg-dpnk-db-proxy service allow connection to AWS Aurora
RDS PG DPNK DB proxy. Docker image use autossh to create tunnel.

### Build Docker aurora-rds-pg-dpnk-db-proxy image and run container

```bash
# Build Docker image
docker buildx build -t auto0mat/aurora-rds-pg-dpnk-db-proxy:<ACTUAL_YEAR>.<SERIAL_NUMBER>

# Run Docker container
chmod 600 "$(pwd)"/aurora-rds-pg-dpnk-db-proxy.pem

docker run -d --rm \
--env="AWS_AURORA_PG_RDS_DPNK_PROXY_REMOTE_HOST=<CHANGE_IT>" \
--env="AWS_E2C_AURORA_PG_RDS_DPNK_PROXY_REMOTE_USERNAME_WITH_HOST=<CHANGE_IT>" \
--mount type=bind,source="$(pwd)"/aurora-rds-pg-dpnk-db-proxy.pem,target=/home/appuser/.ssh_keys/aurora-rds-pg-dpnk-db-proxy.pem
--name=aurora-rds-pg-dpnk-db-proxy \
auto0mat/aurora-rds-pg-dpnk-db-proxy:latest
```

### Licence

[GNU AGPLv3](https://www.gnu.org/licenses/agpl-3.0.en.html) or later.
