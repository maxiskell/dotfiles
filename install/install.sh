#!/bin/bash

BASE_DIR=$(dirname $BASH_SOURCE[0])

sh $BASE_DIR/brew.sh
sh $BASE_DIR/link.sh
sh $BASE_DIR/zsh-plugins.sh
