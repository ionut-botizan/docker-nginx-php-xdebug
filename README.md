# Intro

A basic Docker setup, with zero initial configuration, for a development environment using Docker, Nginx, PHP-FPM, Xdebug.

## Quickstart
Place your code in the `apps/default` folder, then run `docker-compose up` and your app will be available on `http://localhost`, port `80`.

#### Things to know:
* The document root of the server is in the `./apps/default` folder.
* Configuration files are located in the `./config` folder
* Log files will be placed in the `./logs` folder

## Nginx
If you need to customize the Nginx configuration (and you most probably will), make sure that you include in your configuration the `./nginx/xdebug/remote.conf` file. That sets the `remote_host` setting needed by Xdebug to be able to connect back to your IDE.

To add more hosts or edit existing ones, add/edit the files located in `./config/nginx/hosts`.

## Xdebug
The configuration file for Xdebug is located at `./config/php/xdebug.ini`.
By default, Xdebug is configured to use port `9000` and `autostart` is `off`. You can set it to `on` or you can use a browser extension such as [Xdebug helper](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc) for Chrome to only enable debugging when necessary (for performance reasons).

`xdebug.remote_connect_back` is disabled and `xdebug.remote_host` is automatically set by Nginx to one of the special hostnames provided by Docker (`docker.for.win.localhost` or `docker.for.mac.localhost`) after sniffing the client's operating system. (see `./config/nginx/xdebug/remote.conf`)

To see the debug log, un-comment the `xdebug.remote_log` setting in the config file.

## Other

Sample debug configuration for *VS Code* (using the default settings):
```json
{
	"version": "0.2.0",
	"configurations": [
		{
			"name": "Listen for XDebug",
			"type": "php",
			"request": "launch",
			"port": 9000,
			"pathMappings": {
				"/": "${workspaceFolder}/",
			}
		}
	]
}
```