#!/bin/sh

#
# Mongo and Fedora must be running for tests to pass to generate updated docs
#

REPOS="dri-api node-dri node-fedora"

mkdir -p build
for i in $REPOS
do
	if [ -d build/$i ];
	then
		pushd build/$i
		git pull
		popd

	else
		git clone ssh://git@howest-server.tchpc.tcd.ie/howest/node/$i build/$i
	fi
	pushd build/$i
	npm install
	npm update
	make docs
	cp docs/test.md ../../pages/api-for-$i/content.md
	popd
done
