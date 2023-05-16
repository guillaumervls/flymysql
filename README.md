# Deploy MySQL on Fly.io

## How to use

Run (in a Unix shell):

```sh
# Replace "my-mysql-app" by your desired app name:
APP_NAME=my-mysql-app
fly apps create $APP_NAME
fly m run guillaumervls/flymysql:latest \
  --app $APP_NAME \
  -e "FLY_API_TOKEN=$(fly tokens deploy --app $APP_NAME)" \
  --entrypoint "/bin/sleep inf" \
  --metadata fly_platform_version=v2 --metadata fly_process_group=fly_app_console
# Note the machine ID in the previous command's output, and replace "123456" by it below:
MACHINE_ID=123456
fly console --machine $MACHINE_ID \
  -c <(echo 'app="'$APP_NAME'"\nconsole_command='\''/bin/sh -c "cd $WORKDIR && ./entrypoint.sh setup"'\')
fly m destroy $MACHINE_ID --force
```
