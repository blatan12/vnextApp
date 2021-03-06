# Docker file to build a container with my test app in it
FROM microsoft/aspnet:latest
# copy the contents of the local directory to /app/ on the image
ADD . /app/
# set the working directory for subsequent commands
WORKDIR /app
# fetch the NuGet dependencies for our application
RUN kpm restore
# expose TCP port 5004 from container
EXPOSE 5004
# Configure the image as an executable
# When the image starts it will execute the “k kestrel” command
# effectively starting our web application
# (listening on port 5004 by default)
ENTRYPOINT ["k", "kestrel"]
