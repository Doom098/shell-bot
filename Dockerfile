[Forwarded from ReconRex]
FROM phusion/baseimage:master

# Do not change the Docker container. This bionic container eats less juice than Ubuntu 20.04
CMD ["/sbin/my_init"]

# Basic modules to make the container more usable. You can add more btw... 
RUN apt-get update && apt-get install -y \
    bash \
    sudo \
    curl \
    git \
    make \
    busybox \
    wget \
    build-essential \
    nodejs \
    npm \
 && mkdir -p /home/files

# This is the default working directory. Don't change it if you don't know what you're doing.
WORKDIR /home

# Make Your Custom Directory with sudo
RUN mkdir -p /root/.config/rclone/
# This is you default dowload directory for qbit...
RUN mkdir -p /home/dl

COPY bot.sh /home
COPY Setup.sh /home

# This will copy your extra files which you need inside the container.
COPY /files /home/files


RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
RUN tar xvf ngrok-stable-linux-amd64.tgz -C /usr/local/bin
RUN ngrok authtoken 1nNriaJdUZjRleSFuSr7V9yBSB4_6iB6DTKWiWGRGsShZQN7F

# This will copy your rclone config.
RUN cp /home/files/rclone.conf /root/.config/rclone/


# This will run Setup.sh and excute all your command with sudo.
RUN sh /home/Setup.sh \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



# This will install the shell bot aka the core.. of your bot.
RUN git clone https://github.com/botgram/shell-bot.git \
 && cd shell-bot \
 && npm install


# Start the bot
CMD bash /home/bot.sh
