FROM jboss/base-jdk:7

ENV TORQUEBOX_VERSION 3.1.2

# Add the TorqueBox distribution to /opt
RUN curl -L http://repository-projectodd.forge.cloudbees.com/release/org/torquebox/torquebox-dist/$TORQUEBOX_VERSION/torquebox-dist-$TORQUEBOX_VERSION-bin.zip | bsdtar -xf - && mv torquebox-$TORQUEBOX_VERSION torquebox && chmod +x torquebox/jboss/bin/*.sh torquebox/jruby/bin/*

# Expose the ports we're interested in
EXPOSE 8080

# Set the default command to run on boot
# This will boot TorqueBox and bind to all interface
CMD ["/opt/jboss/torquebox/jboss/bin/standalone.sh", "-b", "0.0.0.0"]
