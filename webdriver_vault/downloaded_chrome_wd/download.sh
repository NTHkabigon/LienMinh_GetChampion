#!/usr/bin/env bash
docstring='
CHROMEWD_VERSION=83 ./download.sh
CHROMEWD_VERSION=84 ./download.sh

Download url pattern
    https://chromedriver.storage.googleapis.com/index.html?path=84.0.4147.30/
    .                                                           chromedriverVersion
    https://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_linux64.zip
    .                                           chromedriverVersion
'

if [[ -z $CHROMEWD_VERSION ]]; then v=`google-chrome --version | cut -d' ' -f3`; v=`echo $v | cut -d'.' -f1`;
                               else v=$CHROMEWD_VERSION; fi
echo "CHROMEWD_VERSION=$v"

    t=`mktemp`; curl -s https://chromedriver.chromium.org/downloads 2>&1 1>$t; download_href=`cat $t | grep -E "If you are using Chrome version $v, please download.+If you are using Chrome from Dev" -o | grep -E "href=.+=$v[^\"]+\"" -o`; echo $download_href
    #           open chromewd homepage to download                                                  seek to the version download line                                                                    locate the href
        chrome_webdriver_version=`echo $download_href | cut -d'=' -f3 | cut -d'/' -f1`
        echo; echo "CHROMEWD_VERSION=$v  -->  chrome_webdriver_version=$chrome_webdriver_version"
            url="https://chromedriver.storage.googleapis.com/$chrome_webdriver_version/chromedriver_linux64.zip"; echo "Download linux's chrome webdriver from $url"
            z="/tmp/chromedriver-$chrome_webdriver_version.zip"
            echo; curl -o $z $url
                SH=`cd $(dirname $BASH_SOURCE) && pwd`
                echo; unzip -o $z -d $SH
                    chwd="$SH/chromedriver"
                    echo; ls -lah $chwd; if [[ $? != 0 ]]; then echo 'Download failed'; exit 1; fi
                        mv $chwd "$SH/vault/chromedriver-$chrome_webdriver_version"
