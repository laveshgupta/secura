#!/bin/bash
/privacyidea/pi-manage createdb
/privacyidea/pi-manage create_enckey
/privacyidea/pi-manage create_audit_keys
/privacyidea/pi-manage admin add -e $email -p $password $username
/privacyidea/pi-manage runserver -h $host -p $port