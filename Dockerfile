FROM dorowu/ubuntu-desktop-lxde-vnc

# Install Chromium
RUN apt-get update && \
    apt-get install -y chromium-browser

# Optionally install a default bookmarks/profile here
# COPY bookmarks.html /root/.config/chromium/Default/Bookmarks

# Expose VNC port (5900)
EXPOSE 5900

# Already starts VNC server in dorowu/ubuntu-desktop-lxde-vnc base image
# so nothing else needed
