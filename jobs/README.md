# cronjobs

copy jobs to root and add the following config using `crontab -e`

```bash
0 0 1 * * cd ~/jobs && ./docker-cleanup.sh
```