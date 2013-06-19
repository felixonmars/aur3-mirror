# Maintainer: ogasser <oliver.gasser@gmail.com>
# Contributor: vti <viacheslav.t AT gmail.com>
pkgname=libssh-git
pkgver=release.0.3.0.1874.g89be6d0
pkgrel=1
pkgdesc="Library for accessing ssh client services through C libraries"
arch=('i686' 'x86_64')
url="http://www.libssh.org/"
license=('LGPL')
depends=('openssl' 'zlib')
makedepends=('cmake' 'git')
provides=('libssh')
conflicts=('libssh')
source=('git://git.libssh.org/projects/libssh.git')
md5sums=('SKIP')
_gitname='libssh'


pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  # Build dir...
  mkdir -p build
  cd build

  # Generate Makefile, compile, and install
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
        -DWITH_LIBZ=ON \
        -DWITH_SSH1=ON \
        -DWITH_SFTP=ON \
        -DWITH_SERVER=ON \
        -DWITH_STATIC_LIB=ON .. || return 1 
  make
}

package() {
  cd $_gitname/build
  make DESTDIR="${pkgdir}" install || return 1
}


