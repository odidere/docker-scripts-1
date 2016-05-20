### Docker Scripts
Some of the Docker scripts that I wrote/tweaked useful for me have been committed here without any warranty of any kind. These work exclusively on my OSX El Capitan machine, and may be used in yours too, but use at your own risk.

Before you start using the commands, build first:
```bash
$ make
```

If you'd like to build the images locally that are required by the scripts:
```bash
$ ./build-images.sh
```

If you'd like to download the images locally only, but build them:
```bash
$ ./download-images.sh
```

Now you should be able to access sweet shortcuts on a new Terminal, for example:
##### General Docker usage
```bash
dock                        # Starts Docker machine 

conts                       # List all containers
contbash <container-name>   # ssh-ing into a console for a containers
contlogs <container-name>   # Tailing logs for the specified container
delcont <container-name>    # Remove specified container
delconts                    # Remove all containers

imgs                        # List all images
delimg <image-name>         # Remove a specified image
delimgs                     # Remove all images
delnone                     # Remove all images that are in state <none>
```
##### Development 
```bash
simws                       # Launches a Python simple webserver from the current directory
simwsp <port>               # Same as above, but specified by a port
                            # Known issue of aggressive caching
py <python-file>            # Executes Python script found in the currect directory, has issues.
``` 

##### Testing 
```bash
wrk                         # https://github.com/wg/wrk | Example: wrk http://example.com 
stress                      # http://people.seas.harvard.edu/~apw/stress/ | Example: stress
able                        # https://httpd.apache.org/docs/2.4/programs/ab.html 
                            # Example: ab -n 100 -c 10 http://example.com/
```

Relevant Docker images:
- https://hub.docker.com/r/tsaqib/wrk-alpine/ (4MB)
- https://hub.docker.com/r/tsaqib/stress-alpine/ (4MB)
- https://hub.docker.com/r/tsaqib/py-alpine/ (14MB)
- https://hub.docker.com/r/jess/ab/ (5MB)

