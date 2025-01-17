#!/bin/bash

PREFIX=$(realpath $(dirname $0))

mkdir build
cd build

curl https://cloud.r-project.org/src/base/R-4/R-4.4.2.tar.gz -o R.tar.gz
tar xzf R.tar.gz --strip-components 1

./configure --prefix="$PREFIX" --with-x=no
make -j$(nproc)
make install -j$(nproc)

cd ../
rm -rf build

# Install 'haven' package
echo 'Installing haven...'
"$PREFIX/bin/R" -e 'install.packages("haven", repos = "https://cloud.r-project.org/")'

# Install 'modelsummary' package
echo 'Installing modelsummary...'
"$PREFIX/bin/R" -e 'install.packages("modelsummary", repos = "https://cloud.r-project.org/")'
