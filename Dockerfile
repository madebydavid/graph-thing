FROM debian:stretch

WORKDIR /opt/graph
ADD . /opt/graph

# Run the provisioning script
RUN /opt/graph/scripts/provision.sh

EXPOSE 80

# Serve the website
CMD /opt/graph/scripts/entrypoint.sh