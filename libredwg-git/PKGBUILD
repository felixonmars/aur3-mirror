# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=libredwg-git
pkgver=20110120
pkgrel=2
pkgdesc="A free C library to read and write DWG cad files"
arch=('i686' 'x86_64')
url="https://savannah.gnu.org/projects/libredwg"
license=('GPL')
depends=('python2>=2.3' 'swig>=1.3.17')
makedepends=('git' 'libtool' 'automake' 'autoconf')

build() {
  cd "$srcdir"
  test -d libredwg || git clone git://git.savannah.gnu.org/libredwg.git
  cd libredwg

  # patch obsolete macro in configure.ac
  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac

  sh autogen.sh
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
}

