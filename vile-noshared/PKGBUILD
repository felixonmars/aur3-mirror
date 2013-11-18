# Maintainer: koneu <koneu93 AT googlemail DOT com>

pkgname=('vile-noshared')
pkgver=9.8k
pkgrel=1
pkgdesc="vi like emacs (up to date version with builtin filters)"
arch=('i686' 'x86_64')
url="http://invisible-island.net/vile/vile.html"
license=('GPLv2')
makedepends=('reflex')
provides=('vile')
conflicts=('vile')
source=("ftp://invisible-island.net/vile/current/vile-${pkgver}.tgz")
md5sums=('909103492a92ff7e5a72a5eab2bd25c6')

build() {
  mkdir -p ${srcdir}/${pkgname}-build
  cd ${srcdir}/${pkgname}-build
  ${srcdir}/vile-${pkgver}/configure \
	  --prefix=/usr \
	  --with-flex=reflex \
	  --disable-plugins \
	  --without-perl \
	  --with-builtin-filters \
	  --without-loadable-filters \
	  --without-ncurses \
	  --without-x

  make
}

package() {
	cd ${srcdir}/${pkgname}-build
	make install DESTDIR=${pkgdir}


	install -d $pkgdir/usr/share/licenses/$pkgname
	cat <<EOF >$pkgdir/usr/share/licenses/$pkgname/license
Copyright

Vile is copyrighted by Paul G. Fox, Thomas E. Dickey and Kevin Buettner with some
files (e.g., visvile) copyright by Clark Morgan.
We distribute it under the terms of the GNU Public License, Version 2.
EOF
}
