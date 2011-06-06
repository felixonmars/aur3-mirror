# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=vigra-hg
pkgver=2823
pkgrel=1
pkgdesc="Computer vision library"
arch=('i686' 'x86_64')
url="http://hci.iwr.uni-heidelberg.de/vigra/"
license=('custom:MIT')
depends=('libpng' 'libtiff' 'gcc-libs' 'fftw' 'openexr')
makedepends=('mercurial' 'cmake' 'doxygen')
provides=('vigra')
conflicts=('vigra')
source=()
md5sums=()

_hgroot="http://www.informatik.uni-hamburg.de/~meine/hg"
_hgrepo="vigra"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  mkdir "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DDOCINSTALL=share/doc \
        -DCMAKE_SHARED_LINKER_FLAGS="-lpthread" \
        ../$_hgrepo
  make
}

check() {
  cd "$srcdir/$_hgrepo-build"
  make check
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make DESTDIR="$pkgdir/" install
  # license
  install -D -m644 "$srcdir/$_hgrepo/"LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
} 
