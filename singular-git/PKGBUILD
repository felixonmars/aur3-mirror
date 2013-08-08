# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=singular-git
pkgver=2013.08.07.46e869c
pkgrel=1
pkgdesc="Singular Computer Algebra System (GIT version)"
arch=('i686' 'x86_64')
url="http://www.singular.uni-kl.de/"
license=('GPL2' 'GPL3')
depends=('bash' 'ntl' 'python2')
makedepends=('git' 'flint')
options=(!libtool)
source=('git+https://github.com/Singular/Sources.git#branch=spielwiese')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Sources"
  echo "$(git show -s --format='%cd' --date=short HEAD | sed 's|-|.|g').$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/Sources"
  ./autogen.sh
}

build() {
  cd "$srcdir/Sources"
  ./configure --prefix=/usr --libexecdir=/usr/lib --with-ntl=yes \
              --with-flint=yes --with-python=/usr/bin/python2 --with-readline=dynamic
  make
}

package() {
  cd "$srcdir/Sources"
  make DESTDIR="$pkgdir/" install
}
