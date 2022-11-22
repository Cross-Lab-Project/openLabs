FROM crosslab/edrys_pyxtermjs:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    g++ \
    gcc \
    make

# prepare arduino-cli for container (install as root)
RUN cd / && curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

# Set user and group
ARG user=appuser
ARG group=appuser
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${gid} ${group}
RUN useradd -u ${uid} -g ${group} -s /bin/sh -m ${user} # <--- the '-m' create a user home directory
RUN usermod -a -G dialout ${user}


RUN arduino-cli upgrade
RUN arduino-cli core install arduino:avr

# Switch to user we must not set group to make the configuration done above apply
# !! if ${user} is not setup correctly the next line might result in group being root !!
USER ${user}
