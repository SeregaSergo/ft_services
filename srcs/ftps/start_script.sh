#!/bin/sh

openrc boot
rc-update add vsftpd default
rc-service vsftpd restart

sleep infinity