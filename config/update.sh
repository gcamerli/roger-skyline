#!/bin/bash
# ./update.sh

dnf upgrade -y --refresh >> /var/log/update_script.log
