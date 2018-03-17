#!/bin/bash
c=$1
sed "s/fuckyou/$c/g" 1.45.scm | scheme
