# Do not edit anything Here
cd /home/shell-bot
cat > config.json << EOF
{
    "authToken": "1527929353:AAERlylvfnoUCKttftF9mlWJqL4gRW7F8bw",
    "owner": 1073166978
}
EOF
echo "Created config for Shell bot"
apt-get update

rclone mount rex: /home/dl --allow-non-empty & ls

echo "Created mount for Shell bot"
apt-get update
yes y | qbittorrent-nox & ls

echo "Starting Shell bot"
node server
