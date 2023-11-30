FROM crosslab/edrys_pyxtermjs:latest
#FROM pyxtermjs

#ensure we are root for software install
USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    make

# prepare arduino-cli for container (install as root)
RUN cd / && curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

ARG user=appuser

# add ${user} to dailout group for Arduino device access
RUN usermod -a -G dialout ${user}

# Switch to ${user} for arduino-cli setup
USER ${user}

RUN arduino-cli upgrade
RUN arduino-cli core install arduino:avr

# ensure we are switched to user Switch to user we must not set group to make the configuration done above apply
# !! if ${user} is not setup correctly the next line might result in group being root !!
USER ${user}
