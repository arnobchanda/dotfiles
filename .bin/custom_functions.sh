#!/bin/bash

function fix_path()
{
    LINUX_PATH=$(/usr/bin/printenv PATH | /usr/bin/perl -ne 'print join(":", grep { !/\/mnt\/[a-z]/ } split(/:/));')
    export PATH=$LINUX_PATH
}