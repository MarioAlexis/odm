#!/bin/bash

srcpath=tests/test_data

rm -rf $srcpath/images_resize/ $srcpath/o*/ $srcpath/pmvs/

echo "test folder is now clean"
echo

cd $srcpath
ls -lF
cd ../../
