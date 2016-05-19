### Docker Scripts
Some of the Docker scripts that I wrote/tweaked useful for me have been committed here without any warranty of any kind. These work exclusively on my OSX El Capitan machine, and may be used in yours too, but use at your own risk.

Before you start using the commands, build first:
```bash
$ make
```

If you'd like to build the images locally that are required by the scripts:
```bash
./build-images.sh
```

Now you should be able to access sweet shortcuts on a new Terminal, for example:
```bash
wrk             # https://github.com/wg/wrk
stress          # http://people.seas.harvard.edu/~apw/stress/
```

Relevant Docker images:
- https://hub.docker.com/r/tsaqib/wrk-alpine/ (4MB)
- https://hub.docker.com/r/tsaqib/stress-alpine/ (4MB)

