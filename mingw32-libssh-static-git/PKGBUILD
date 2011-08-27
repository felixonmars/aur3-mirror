# Contributor: vti <viacheslav.t AT gmail.com>
pkgname=mingw32-libssh-static-git
pkgver=20090812
pkgrel=1
pkgdesc="Library for accessing ssh client services through C libraries"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('mingw32-openssl-static' 'mingw32-zlib-static')
makedepends=('cmake' 'mingw32-gcc')
source=('toolchain-mingw32.cmake')
url="http://www.libssh.org/"
md5sums=('bbea873ba169fc9c00ddacfb2fcef4a8')
_gitroot='git://git.libssh.org/projects/libssh/libssh.git'
_gitname='libssh'

build() {
  cd $startdir/src

  msg "Connecting to git.libssh.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
      cd $_gitname
  fi

  #git apply $startdir/static-lib.patch
  #git apply $startdir/socket-timeout.patch
  #git apply $startdir/no-x11.patch

  # Build dir...
  mkdir -p build
  cd build

  # Generate Makefile, compile, and install
  cmake -DCMAKE_TOOLCHAIN_FILE=../../toolchain-mingw32.cmake \
        -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32 \
        -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
        -DWITH_LIBZ=ON \
        -DWITH_SSH1=ON \
        -DWITH_SFTP=ON \
        -DWITH_SERVER=OFF \
        -DWITH_STATIC_LIB=ON \
        -DCMAKE_SKIP_RPATH=ON .. || return 1
  make
  make DESTDIR=${pkgdir} install || return 1
}
