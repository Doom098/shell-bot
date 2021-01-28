[Forwarded from ReconRex]
echo "Performing additional setup 1"
mkdir -p /root/.local/share/qBittorrent
add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
apt-get install -y qbittorrent-nox
curl https://rclone.org/install.sh | bash

echo "Performing additional setup 2"

cp -Ra /home/files/qBittorrent/ /root/.local/share/
echo "Performing additional setup 3"

apt-get update
apt-get install -y tmate

apt-get update
apt-get install -y fuse
