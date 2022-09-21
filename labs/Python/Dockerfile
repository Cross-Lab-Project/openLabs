FROM crosslab/edrys_pyxtermjs:latest

# change the user, so that the packages can be installed on top of edrys_pyxtermjs
USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3

# get back to the default appuser
USER ${user}

EXPOSE 5000

ENTRYPOINT python3 -m pyxtermjs --cors True --host 0.0.0.0 --command zsh
