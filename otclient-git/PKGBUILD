pkgname=otclient-git
pkgver=20130123
pkgrel=1
license=('MIT')
pkgdesc="An alternative tibia client for otserv"
url="https://github.com/edubart/otclient"
arch=('i686' 'x86_64')
license=('MIT')
depends=('lua' 'boost' 'physfs' 'mesa' 'openssl' 'zlib' 'glew' 'openal' 'libvorbis' 'libogg')
makedepends=('git' 'cmake')
install='otclient.install'

_gitroot=git://github.com/edubart/otclient.git
_gitname=otclient

build() {
  cd $srcdir
  if [[ -d $_gitname ]]; then
    cd $_gitname
    git pull origin master
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  rm -rf build
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_REVISION="`git rev-list --all | wc -l`" \
        -DBUILD_COMMIT="`git describe --dirty --always`" \
        -DBOT_PROTECTION=OFF \
        -DUSE_STATIC_LIBS=OFF \
        ..
  make
}

package() {
  cd $srcdir/$_gitname/build
  make DESTDIR=$pkgdir install
}
