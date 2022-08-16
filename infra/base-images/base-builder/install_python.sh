#!/bin/bash -eux
# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

echo "ATHERIS INSTALL"
unset CFLAGS CXXFLAGS
# PYI_STATIC_ZLIB=1 is needed for installing pyinstaller 5.0
export PYI_STATIC_ZLIB=1
# Uncomment this if we need to specify the clang-15 location of libFuzzer.
# CLANG_BIN=$(which clang) LIBFUZZER_LIB=/usr/local/lib/clang/15.0.0/lib/x86_64-unknown-linux-gnu/libclang_rt.fuzzer_no_main.a
pip3 install -v --no-cache-dir "pyinstaller==5.0.1" "coverage==6.3.2"
git clone https://github.com/google/atheris
cd atheris
git checkout 0cfd3c7e0cb1eca4580e796a008d36a67ed5ad75
# Not needed until Clang is rolled: LIBFUZZER_LIB=/usr/local/lib/clang/15.0.0/lib/x86_64-unknown-linux-gnu/libclang_rt.fuzzer_no_main.a
pip3 install .
cd -
rm -rf atheris
rm -rf /tmp/*
