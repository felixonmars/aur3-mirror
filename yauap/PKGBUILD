# Contributor: Vinzenz Vietzke <vinz@archlinux.us>

pkgname=yauap
pkgver=0.2.4
pkgrel=1
pkgdesc="A simple commandline player for gstreamer."
arch=('i686')
url="http://www.nongnu.org/yauap/"
license=('LGPL')
depends=('gstreamer0.10-base' 'dbus-glib')
source=(http://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

md5sums=('319de4763ca1bdfc08e245646b71c1e8')
