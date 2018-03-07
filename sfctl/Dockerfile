FROM microsoft/azure-cli

# Install sfctl in it's own virtualenv to not clash with azure-cli
RUN pip3 install virtualenv && \
    mkdir sfctl && \
    virtualenv sfctl/ && \
    source sfctl/bin/activate && \
    pip3 install sfctl

# Install TMUX
RUN apk update && \
    apk add tmux

COPY tmux.conf /root/.tmux.conf

RUN echo -e "\n[[ -z \"$TMUX\" ]] && exec tmux" >> ~/.bashrc