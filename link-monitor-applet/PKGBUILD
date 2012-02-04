# Maintainer: kang <kang@insecure.ws>
pkgname=link-monitor-applet
pkgver=3.0
pkgrel=1
pkgdesc="A GNOME Panel Applet displaying the round-trip time to a set of hosts in a bar graph (ping)."
arch=(x86 x86_64)
url="http://www.nongnu.org/link-monitor/"
license=('GPL')
depends=('gnome-desktop')
source=(http://savannah.nongnu.org/download/link-monitor/$pkgname-$pkgver.tar.bz2)
md5sums=('64d89b8b9bafa443d2aaa99f274a56d9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./jb configure prefix=/usr destdir="$pkgdir/"
  ./jb build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  ./jb install
}

# vim:set ts=2 sw=2 et:
