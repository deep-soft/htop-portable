#!/bin/bash

REPO_DIR=$GITHUB_WORKSPACE
BUILD_DIR=build
INSTALL_DIR=install

if [[ $(awk -F= '/^ID=/ {print $2}' /etc/os-release) == "alpine" ]]; then
  CMAKE_OPTS+=( "-DMUSL=ON" )
fi

#QUILT_PATCHES=$REPO_DIR/patches quilt push -a

./autogen.sh

./configure --enable-werror --enable-openvz --enable-vserver --enable-ancient-vserver --enable-unicode --enable-hwloc --enable-delayacct --enable-sensors --enable-capabilities || ( cat config.log; exit 1; )

make -k

find $REPO_DIR -type d -path "*/AppDir" -exec tar cJvf htop.tar.xz -C {} . \;

if [[ "$STANDALONE" == "true" ]]; then
  ( cd $INSTALL_DIR && ./htop --help >/dev/null && bash -x $REPO_DIR/make_standalone.sh ) && \
  makeself --keep-umask $REPO_DIR/htop/$BUILD_DIR/$INSTALL_DIR $PKG_NAME.run "htop" ./htop && \
  find $REPO_DIR -type f -name $PKG_NAME.run -exec bash -c "tar cvf ${PKG_NAME/${VERSION}_}.run.tar --transform 's|.*/||' {}" \;
fi

ccache --max-size=50M --show-stats
