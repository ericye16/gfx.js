#!/usr/bin/env bash

echo "==> installing Node.js dependencies"
if [[ `which npm` == '' ]]; then
    echo '==> npm not found, aborting... please install Node.js + NPM'
    exit -1
fi
npm install

echo "==> installing static resources into ~/.gfx.js/"
mkdir -p ~/.gfx.js/
cp -r * ~/.gfx.js/
chmod -R a+w ~/.gfx.js/

if [[ `which luajit` == '' ]]; then
    echo '==> luajit not found, aborting... it must be in your path (this is a stupid installer)'
    exit -1
fi

DIR=`dirname \`which luajit\``/../share/lua/5.1/gfx/
echo "==> installing torch client into" $DIR
mkdir -p $DIR || sudo mkdir -p $DIR
cp clients/torch/* $DIR 2> /dev/null || sudo cp clients/torch/* $DIR 2> /dev/null

BINDIR=`dirname \`which luajit\``
cp bin/gfx $BINDIR

echo "==> Torch client installed globally, run me like this:"
echo "$ luajit -lgfx.start"
echo "or"
echo "$ luajit -lgfx.go"
echo "(this will start the gfx server automatically)"

echo "gfx command-line binary installed. Use it to display images quickly"
echo "$ gfx test.jpg"

