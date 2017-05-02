#!/bin/bash

# microsoft
wget -O /tmp/microsoft.asc https://packages.microsoft.com/keys/microsoft.asc
rpm --import /tmp/microsoft.asc

# google chrome
wget -O /tmp/google_linux_signing_key.pub https://dl.google.com/linux/linux_signing_key.pub
rpm --import /tmp/google_linux_signing_key.pub