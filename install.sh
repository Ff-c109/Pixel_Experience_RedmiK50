#!/bin/bash

cat Data/*.zstd.* | pv -s 8G | zstd -d | openssl enc -d -aes-256-cbc -salt -pbkdf2 -pass file:./PEFor_Redmi_K50.key.txt | zstd -d | tar -xC .
bash ./flash_all.sh
git checkout .
git clean -f
