# Maintainer: Gregor Burger <burger.gregor@gmail.com>

pkgname=lyx-beta
_pkgname=lyx
pkgver=2.0.0rc3
pkgrel=1
pkgdesc="An advanced open-source document processor."
arch=('i686' 'x86_64')
url="http://www.lyx.org"
depends=('qt' 'texlive-core' 'python2' 'perl' 'imagemagick' 'aspell' 'aiksaurus' 'boost-libs')
makedepends=('boost')
optdepends=('texlive-latex3: pdf export')
license=('GPL')
source=(ftp://ftp.lyx.org/pub/lyx/devel/lyx-2.0/rc3/$_pkgname-$pkgver.tar.gz \
	lyx.desktop)
conflicts=('lyx')
md5sums=('2d8013cfebdeb13e345c40fcf190dad0'
         'c11db315dc99254a4118827f98922623')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  find . -type f -exec sed -i 's|#!.*python|#!/usr/bin/env python2|' {} +
  sed -i 's|"python|"python2|' lib/configure.py src/support/os.cpp
  PYTHON=/usr/bin/python2 PYTHON_VERSION=2.7 ./configure --prefix=/usr \
    --with-frontend=qt4 --without-included-boost
  make -j 8
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  # install desktop entry
  install -Dm644 ${srcdir}/lyx.desktop ${pkgdir}/usr/share/applications/lyx.desktop
}
