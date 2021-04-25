#!/bin/bash

systemctl enable NetworkManager
systemctl enable gpm
systemctl enable lightdm
systemctl enable preload
systemctl enable docker

