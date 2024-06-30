#!/bin/bash
v="1.49.0";

mkdir -p ../../_dist;

mv ./libs/armeabi-v7a/neon/libffmpeg.mx.so ../../_dist/libffmpeg.mx.so.neon.$v;
mv ./libs/arm64-v8a/libffmpeg.mx.so ../../_dist/libffmpeg.mx.so.neon64.$v;
mv ./libs/x86_64/libffmpeg.mx.so ../../_dist/libffmpeg.mx.so.x86_64.$v;
mv ./libs/x86/libffmpeg.mx.so ../../_dist/libffmpeg.mx.so.x86.$v;

cd ../../_dist;

zip -9 -r mx_neon.zip libffmpeg.mx.so.neon.$v;
zip -9 -r mx_neon64.zip libffmpeg.mx.so.neon64.$v;
zip -9 -r mx_x86.zip libffmpeg.mx.so.x86.$v;
zip -9 -r mx_x86_64.zip libffmpeg.mx.so.x86_64.$v;
zip -9 -r mx_aio.zip libffmpeg.mx.so.x86.$v libffmpeg.mx.so.x86_64.$v libffmpeg.mx.so.neon.$v libffmpeg.mx.so.neon64.$v;
rm -rfv *.$v;

tree . ;
