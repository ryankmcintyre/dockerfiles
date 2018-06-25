FROM microsoft/azure-cli

# Run any updates
RUN apk update && \
    apk upgrade

# Install sfctl in it's own virtualenv to not clash with azure-cli
# (Didn't dig into why, but starting with sfctl 5 build, I needed to add the build-dependencies as a package was being built during sfctl install.
# Remove that when you figure out what needs it and fix it.)
RUN pip3 install virtualenv && \
    mkdir sfctl && \
    virtualenv sfctl/ && \
    source sfctl/bin/activate && \
    apk --update add --virtual build-dependencies libffi-dev make gcc python-dev openssl-dev py-pip build-base && \
    pip3 install sfctl && \
    apk del build-dependencies

# Install TMUX and copy files over
RUN apk add tmux

COPY tmux.conf /root/.tmux.conf
COPY setup-tmux.sh /root/setup-tmux.sh
RUN chmod +x /root/setup-tmux.sh

# Execute setup script on entry
ENTRYPOINT /root/setup-tmux.sh