#!/usr/bin/env bash
SH=`cd $(dirname $BASH_SOURCE) && pwd`

chv=`google-chrome --version`
  v=`echo $chv | cut -d' ' -f3 | cut -d'.' -f1`
    echo "Activating $chv..."
    chromedriver_f=`ls "$SH/vault" | grep $v`; fp="$SH/vault/$chromedriver_f"  # p aka full path
        if [[ ! -f $fp ]]; then echo "chromedriver not found for $chv"; fi
        cp -f $fp "$SH/chromedriver"
            echo 'Your chromedriver is ready at'; ls "$SH/chromedriver"
