# Maintainer: iaul2i38c <iaul2i38c@enjoys.it>

_name=thtk
pkgname=$_name-hg
pkgver=234
pkgrel=1
pkgdesc='A collection of tools for exploring and modifying the Touhou game series.'
arch=('i686' 'x86_64')
url='http://thtk.googlecode.com/'
license=('bsd')
depends=('libpng' 'zlib')
makedepends=('mercurial' 'autoconf')
provides=("$_name=5")
conflicts=($_name)

_hgtrunk=http://thtk.googlecode.com/hg
_hgmod=$_name

build() {
  cd "$srcdir"

  if [ -d $_hgmod/.hg ]; then
    cd $_hgmod
    hg pull -u
  else
    hg clone $_hgtrunk $_hgmod
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_hgmod"
  autoreconf -fi
  ./configure --prefix=${pkgdir}/usr
  make
  make install

#  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
#  install -m644 LICENSE COPYING "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
}
