#!/bin/bash
sudo groupadd docker
sudo usermod -aG docker $USER
sudo su $USER
sudo systemctl enable docker
