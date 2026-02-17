#!/bin/bash

SESSION="rov_session"

# Buat sesi tmux baru di background
tmux new-session -d -s $SESSION

# Jendela 1 (Kiri): Jalankan Mavros
tmux rename-window -t $SESSION:0 'System'
tmux send-keys -t $SESSION:0 './ireng_run_mavros.sh' C-m

# Belah layar jadi dua (Horizontal Split)
tmux split-window -h

# Jendela 2 (Kanan): Jalankan Kamera
tmux send-keys -t $SESSION:0.1 './ireng_run_stream.sh' C-m

# Masuk ke tampilan tmux
tmux attach -t $SESSION

