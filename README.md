### Docker Scripts
Some of the Docker scripts that I wrote/tweaked useful for me have been committed here without any warranty of any kind. These work exclusively on my OSX El Capitan machine, and may be used in yours too, but use at your own risk. I have written them according to my own convention over configuration mindset, therefore in many instances, names, ports, etc. are assigned as freely willed.

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
contsh <container-name>     # Log into the shell for a container
contlogs <container-name>   # Tailing logs for the specified container
rmcont <container-name>     # Remove specified container
rmconts                     # Remove all containers

imgs                        # List all images
rmimg <image-name>          # Remove a specified image
rmimgs                      # Remove all images
rmnone                      # Remove all images that are in state <none>
```

##### General commands
```bash
get                         # wget 
```

##### Applications 
```bash
odoo9                       # Runs Odoo 9 Community Edition at port 10101
odoo9p <port>               # Same as above, but specified by a port
bahmni                      # (doesn't work yet) Runs Bahmni at port 10201
``` 

##### Development 
```bash
mysql                       # Launches MySQL, user: root, password: root, port: 10301
simws                       # Launches a Python simple webserver from the current directory
simwsp <port>               # Same as above, but specified by a port
                            # Known issue of aggressive caching
py <python-file>            # Executes Python script found in the currect directory, has issues
``` 

##### Testing 
```bash
wrk                         # https://github.com/wg/wrk | Example: wrk http://example.com 
stress                      # http://people.seas.harvard.edu/~apw/stress/ | Example: stress
ab                          # https://httpd.apache.org/docs/2.4/programs/ab.html 
                            # Example: ab -n 100 -c 10 http://example.com/
```

Relevant Docker images:
- https://hub.docker.com/r/tsaqib/wrk-alpine/ (4MB)
- https://hub.docker.com/r/tsaqib/stress-alpine/ (4MB)
- https://hub.docker.com/r/tsaqib/py-alpine/ (14MB)
- https://hub.docker.com/r/jess/ab/ (5MB)
- https://hub.docker.com/_/postgres/ (101MB)
- https://hub.docker.com/_/odoo/ (272MB)
- https://hub.docker.com/r/bahmni/bahmni/ (840MB)
