# Contributor: Peter Expat <peterexpat@gmail.com>

pkgname=yougrabber
pkgver=0.29.4
pkgrel=1
pkgdesc="Command line YouTube.com video downloader with proxy (HTTP, SOCKS 4 and 5) support."
arch=('i686' 'x86_64')
url="http://yougrabber.sourceforge.net/"
license=('GPL')
depends=(ncurses curl glib)
source=(http://downloads.sourceforge.net/sourceforge/yougrabber/$pkgname-$pkgver.tar.gz)
md5sums=('face6f98651498292c7b520b72f1f301')

build() {
  cd "$startdir/src/$pkgname-$pkgver/src"

  make || return 1
  make PREFIX=$startdir/pkg/usr install || return 1
}

