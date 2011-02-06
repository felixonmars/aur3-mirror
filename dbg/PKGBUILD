# Contributor: Chris Allison <chris.allison@hotmail.com>
pkgname=dbg
pkgver=2.15.5
pkgrel=2
pkgdesc="A full-featured php debugger"
arch=('i686')
url="http://www.php-debugger.com/dbg/"
license=('DBG')
depends=('php')
install=${pkgname}.install

source=(http://downloads.sourceforge.net/sourceforge/dbg2/$pkgname-$pkgver.tar.gz)
md5sums=('1183c5d87635adf77b416787e4916965')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # patch -Np1 -i ../dvbstreamer-1.1-epgtoxmltv-seriesid.patch || return 1

  ./configure --prefix=/usr/lib/php/20060613 --with-dbg-profiler --with-php-config=/usr/bin/php-config --enable-dbg=shared
  make || return 1

  chmod +x "$srcdir/$pkgname-$pkgver/build/shtool"

  make INSTALL_ROOT="$pkgdir" install

# install licence
  mkdir -p "$pkgdir/usr/share/licenses/common/DBG"
  cp "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/common/DBG/licence.txt"
  chmod 644 "$pkgdir/usr/share/licenses/common/DBG/licence.txt"

  # install INSTALL file for user configuration steps
  mkdir -p "$pkgdir/usr/share/DBG/"
  cp "$srcdir/$pkgname-$pkgver/INSTALL" "$pkgdir/usr/share/DBG/INSTALL"
  chmod 644 "$pkgdir/usr/share/DBG/INSTALL"
}

# vim:set ts=2 sw=2 et:
