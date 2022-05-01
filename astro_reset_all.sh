#!/bin/bash

astro_reset_batch.sh L
astro_reset_batch.sh R
astro_reset_batch.sh G
astro_reset_batch.sh B
astro_reset_batch.sh H
astro_reset_batch.sh O
astro_reset_batch.sh S

files=$(ls ./dark/* 2> /dev/null | wc -l)

if [ "$files" == "0" ]
then
    rmdir ./dark
fi

files=$(ls ./stacked_channels/* 2> /dev/null | wc -l)

if [ "$files" == "0" ]
then
    rmdir ./stacked_channels
fi
