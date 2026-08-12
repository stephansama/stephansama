#!/usr/bin/env sh

find tasks -type f ! -name '*.md' ! -path '*/utility/*' -exec chmod u+x {} \;
