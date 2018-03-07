FROM microsoft/azure-cli

# Install sfctl in it's own virtualenv to not clash with azure-cli
RUN pip3 install virtualenv && \
    mkdir sfctl && \
    virtualenv sfctl/ && \
    source sfctl/bin/activate && \
    pip3 install sfctl

# Install TMUX and copy files over
RUN apk update && \
    apk add tmux

COPY tmux.conf /root/.tmux.conf
COPY setup-tmux.sh /root/setup-tmux.sh
RUN chmod +x /root/setup-tmux.sh

# Execute setup script on entry
ENTRYPOINT /root/setup-tmux.sh