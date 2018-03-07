#!/bin/sh 
tmux new-session -d
tmux split-window -h 
tmux send-keys -t 1 'source sfctl/bin/activate' Enter
tmux -2 attach-session -d 
