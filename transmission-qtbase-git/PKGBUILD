# Maintainer: Federico Di Pierro <nierro92 at gmail.com>

pkgbase=transmission
pkgname=transmission-qtbase-git
pkgver=2.82
pkgrel=1
pkgdesc="Fast, easy, and free BitTorrent client (qtbase-git GUI)"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
depends=('curl' 'qtbase-git' 'libevent')
optdepends=('transmission-cli: daemon and web support')
makedepends=('intltool' 'curl' 'qtbase-git' 'libevent')
provides=('transmission-qt')
conflicts=('transmission-qt')
install=transmission-qt.install
source=(http://mirrors.m0k.org/transmission/files/$pkgbase-$pkgver.tar.xz)
md5sums=('a5ef870c0410b12d10449c2d36fa4661')

build() {
  cd $pkgbase-$pkgver

  ./configure --prefix=/usr
  make
  pushd qt
  qmake qtr.pro
  make
}

  
package_transmission-qt() {
  cd $pkgbase-$pkgver

  make -C qt INSTALL_ROOT="$pkgdir"/usr install

  install -D -m644 COPYING "$pkgdir/usr/share/licenses/transmission-qt/COPYING"
  install -D -m644 qt/icons/transmission.png "$pkgdir/usr/share/pixmaps/transmission-qt.png"
  install -D -m644 qt/transmission-qt.desktop "$pkgdir/usr/share/applications/transmission-qt.desktop"
}