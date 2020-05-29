# docker-sabnzbd3-python3.9
Docker image with SABnzbd3 (from github) with python 3.9


# Build

sudo docker build  -t="sabnzbd-py3" .

# Run
sudo docker run -p 8080:8080 --name sabnzbd-py3 sabnzbd-py3

# Remove:
sudo docker rm sabnzbd-py3

# output on stdout

```
2020-05-29 20:43:38,441::INFO::[SABnzbd:1089] --------------------------------
2020-05-29 20:43:38,441::INFO::[SABnzbd:1090] SABnzbd.py-3.0.0-develop (rev=unknown)
2020-05-29 20:43:38,442::INFO::[SABnzbd:1091] Full executable path = /sabnzbd/SABnzbd.py
2020-05-29 20:43:38,442::INFO::[SABnzbd:1101] Platform = posix
2020-05-29 20:43:38,442::INFO::[SABnzbd:1102] Python-version = 3.9.0b1 (default, May 19 2020, 01:22:54) 
[GCC 9.3.0]
```
Note the python version: 3.9.x
