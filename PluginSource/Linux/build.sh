#!/bin/bash
set -e
mkdir -p build build/bin build/obj

g++ -g -c -O2 -fPIC -o build/obj/Plugin.o ../Plugin.cpp
g++ -shared -o build/bin/Nice1Plugin.so build/obj/Plugin.o
objcopy --only-keep-debug build/bin/Nice1Plugin.so build/bin/Nice1Plugin.debug
strip --strip-debug build/bin/Nice1Plugin.so
cp -t "../../Unity Project/Assets/Plugins/Linux/" build/bin/Nice1Plugin.so build/bin/Nice1Plugin.debug