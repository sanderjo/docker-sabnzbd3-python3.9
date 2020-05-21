# docker-sabnzbd3-python3.9
Docker image with SABnzbd3 (from github) with python 3.9


# Build

sudo docker build  -t="sabnzbd-py3" .

# Run
sudo docker run -p 8080:8080 --name sabnzbd-py3 sabnzbd-py3
