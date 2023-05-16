# Docker IPC Access Check Tool

This tool checks if you have access to an Inter-Process Communication (IPC) file on the host system from inside a Docker container.

It was created for debugging issues accessing a Geth IPC endpoint ran by the host system from an application running in a docker container but should be useful for testing similar permission issues with any file.

## ⚠️ Important

To access an IPC file on the host system with permission restrictions, your user ID should match the user ID which owns the IPC file or a user ID which has access to it.

## Getting Started

Clone the repository:

```bash
git clone https://github.com/NotCoffee418/docker-ipc-access-check
```

## Configuration

Modify the `docker-compose.yml` file in the cloned repository. The file should look like this:

```yaml
version: '3'
services:
  check_ipc_permissions:
    build: 
      context: .
      dockerfile: Dockerfile
      args: 
        - USER_NAME=usertotest
        - USER_ID=1234
    volumes:
      - /path/to/host/file.ipc:/path/in/container/file.ipc
```

#### User and Id
Change the `args` to reflect the user you want to test.  
This will create a user in the container's userspace matching your host.  
As stated previously, only the user ID should matter to ensure the permissions match.  

#### IPC Path
Modify the volume on the host system only to point to your ipc file.  
The internal file path `/path/in/container/file.ipc` is literal and should not be modified.

## Running the Tool

After modifying the `docker-compose.yml` file, build and run the docker compose:

```bash
docker compose up --build
```

The tool will print whether the container has access to the IPC file or not.  
Your output should look like this if all goes well:

```
Running as UID = 110
️✔ ok: IPC file exists and is readable
✔ ok: Write check completed
Tests completed
```


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
