# Maintainer: Jonny Gerold <jonny@fsk141.com>

pkgname=dwm-fsk141
_pkgname=dwm
pkgver=6.0
pkgrel=1
pkgdesc="A dynamic window manager for X (Custom version with bstack, and other tweaks)"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'terminus-font' 'roxterm')
source=(http://dl.suckless.org/${_pkgname}/${_pkgname}-$pkgver.tar.gz \
	http://dwm.suckless.org/patches/${_pkgname}-$pkgver-bstack.diff \
	config.h)

md5sums=('8bb00d4142259beb11e13473b81c0857'
         'b60183f343d3912e841d5cbda3de768f'
         'd6f0b2c2de2548924658c8ade304025a')

build() {
  cd $srcdir/$_pkgname-$pkgver

  # cp local config.h to a nice place
  cp $srcdir/config.h config.h

  # Apply bstack patch
  patch -p1 < $srcdir/${_pkgname}-$pkgver-bstack.diff

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 || return 1
  make PREFIX=/usr DESTDIR=$pkgdir install || return 1

  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE && \
  install -m644 -D README $pkgdir/usr/share/doc/$_pkgname/README
}
