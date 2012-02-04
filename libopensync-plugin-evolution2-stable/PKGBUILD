# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=libopensync-plugin-evolution2-stable
pkgver=0.22
pkgrel=1
pkgdesc='Novell Evolution plugin for OpenSync'
arch=('i686' 'x86_64')
url="http://www.opensync.org"
license="LGPL"
depends=('libopensync-stable' 'evolution-data-server')
makedepends=('cmake')
options=('!libtool')
source=("http://www.opensync.org/download/releases/$pkgver/libopensync-plugin-evolution2-$pkgver.tar.bz2")
md5sums=('c4419dd2451bd1595fe42fcf96a9ba45')

build() {
  cd $srcdir/libopensync-plugin-evolution2-$pkgver
  ./configure
  make || return 1
  make DESTDIR="$pkgdir/" install
}
