### Windows with Docker Desktop WSL 2 backend

The vm.max_map_count setting must be set in the docker-desktop container:
```sh
wsl -d docker-desktop
sysctl -w vm.max_map_count=262144
```
