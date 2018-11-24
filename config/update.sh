#!/bin/bash
# ./update.sh

dnf updgrade -y --refresh >> /var/log/update_script.log
