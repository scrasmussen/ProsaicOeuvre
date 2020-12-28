#!/bin/bash

f=c_tmp.txt
column -t $f > new.txt
mv new.txt ${f}
