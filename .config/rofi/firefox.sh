#!/bin/sh

# https://github.com/MusicalArtist12/rofi-firefox-bookmark

# Juliaviolet.dev | Sept 2023
# Modified Stephan Randle | May 2024

# UI states 'Shift+Return: new window', but expects ROFI_RETV == 11 to do so. which by default is 'Alt+1.'
# To match the stated UI, add these lines to your config file.\
#
# configuration {
# ...
#    kb-custom-1:"Shift+Return";
#    kb-accept-alt:"Alt+1";   
# }
#

# ruthlessly modified from a dmenu script to be native to rofi. 

export DB="${HOME}/.cache/rofibookmarksdb"

gen_bookmark() {
    # search for profile folder if not specified
    if [ -z "$bookmarks_folder" ]; then
        bookmarks_folder=$(find ~/.mozilla/firefox/ -maxdepth 2 -type d | grep -E 'default.*weave' | grep -v -E 'nightly$' | awk 'NR==1')
        if [ -z "$bookmarks_folder" ]; then
            echo "unable to detect firefox profile. please specify manually in source."
            exit 1
        fi
    fi

    # bookmarks db is always locked when firefox is running
    # as a workaround, we can just create a copy of the db
    csum_orig=$(sha1sum "${bookmarks_folder}"/bookmarks.sqlite | awk '{print $1}')
    csum_copy=$(sha1sum "${bookmarks_folder}"/bookmarks_copy.sqlite 2> /dev/null | awk '{print $1}')

    # only create a new copy if the db has been modified
    if [ "$csum_orig" != "$csum_copy" ]; then
        /usr/bin/cp -f "${bookmarks_folder}"/bookmarks.sqlite "${bookmarks_folder}"/bookmarks_copy.sqlite
    fi

    # fetch all bookmark records from copy, show menu and open selected bookmark in browser
    sqlite3 "${bookmarks_folder}"/bookmarks_copy.sqlite 'SELECT i.title, u.url FROM items i, urls u WHERE (i.urlId = u.id)' \
    | sed 's/|http/:http/' > "${DB}"

    while read -r line; do
        LINK=$(echo -en "$line" | grep -Eo '(http|https)://.*') 
        TITLE=$(echo -en $line | cut -d: -f1)

        echo -en "${TITLE}\0info\x1f${LINK}\x1ficon\x1fbookmarks\n"
    done < "${DB}"
}

if [ -z $@ ]
    then
        gen_bookmark | sort -n
        echo -en "\0message\x1f<b>shift+enter</b>: new window  <b>enter</b>: new tab\n"
        echo -en "\0use-hot-keys\x1ftrue\n"

    else 
        if [ $ROFI_RETV == 10 ]; then 
            coproc (firefox --new-window ${ROFI_INFO} > /dev/null 2>&1 )
        else 
            coproc (firefox --new-tab ${ROFI_INFO} >/dev/null 2>&1 )
        fi
fi
