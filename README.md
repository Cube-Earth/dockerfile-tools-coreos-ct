# Introduction
With the config transpiler, config files (simliar, but not identical to cloud-config files) can be converted to Ignition JSON format.
The purpose of this container is hosting the ct tool.

# Usage
```
curl -O docker-compose.yml https://github.com/Cube-Earth/dockerfile-tools-coreos-ct/docker-compose.yml
docker-compose pull

docker-compose run --rm main << EOF
storage:
  files:
    - path: /home/core/.bashrc
      filesystem: root
      contents:
        inline: |
          . /usr/share/skel/.bashrc
          alias ll="ls -l"
      mode: 0644
      user:
        id: 500
      group:
        id: 501
EOF
```

# Download
```
docker pull cubeearth/tools-coreos-ct
```
or, if you only need the binary for Alpine, look [here](https://github.com/Cube-Earth/tools-coreos-ct/releases).



# References
- https://github.com/coreos/container-linux-config-transpiler
- https://github.com/Cube-Earth/tools-coreos-ct
- https://hub.docker.com/r/cubeearth/tools-coreos-ct/
