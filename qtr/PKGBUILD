# $Id$
# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=qtr
pkgver=1.93
pkgrel=1
pkgdesc="Fast, easy, and free BitTorrent client (Only Beta Qt GUI)"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT' 'GPL')
depends=('curl' 'qt>=4' 'openssl')
makedepends=('intltool')
conflicts=('transmission-qt')
replaces=('transmission-qt')
install=transmission-qt.install
source=(http://mirrors.m0k.org/transmission/files/transmission-$pkgver.tar.bz2
qtransmission.desktop
qtransmission.png)

build() {
# Build Command-Line client
cd "$srcdir/transmission-$pkgver"
./configure --prefix=/usr --disable-gtk --disable-wx --disable-cli --disable-daemon || return 1
make || return 1

# Build Qt GUI
cd "$srcdir/transmission-$pkgver/qt"
qmake qtr.pro || return 1
make || return 1
INSTALL_ROOT=$pkgdir/usr make install || return 1

# Add freedesktop compatibility
install -D -m 664 $srcdir/qtransmission.png $pkgdir/usr/share/pixmaps/qtransmission.png || return 1
install -D -m 664 $srcdir/qtransmission.desktop $pkgdir/usr/share/applications/qtransmission.desktop || return 1
install -D -m 664 $srcdir/transmission-$pkgver/COPYING $pkgdir/usr/share/licenses/transmission-qt/COPYING || return 1
}
md5sums=('f68358d03e46bec5704bbaa894990152'
         'f206324293290e8f40984800707c103d'
         '96cc659d172574460c593f8f66305fe7')
