# Docker file to build a container with my test app in it
FROM microsoft/aspnet:latest
# copy the contents of the local directory to /app/ on the image
ADD . /app/
# set the working directory for subsequent commands
WORKDIR /app
# fetch the NuGet dependencies for our application
RUN kpm restore
# set the working directory for subsequent commands
# WORKDIR /app/src/helloworldweb
# expose TCP port 5000 from container
EXPOSE 5000
# Configure the image as an executable
# When the image starts it will execute the “k web” command
# effectively starting our web application
# (listening on port 5000 by default)
ENTRYPOINT ["k", "web"]
