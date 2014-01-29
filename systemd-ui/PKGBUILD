# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Based on systemd-ui-git

pkgname=systemd-ui
pkgver=3
pkgrel=1
pkgdesc="Session and startup manager -- GUI components"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2')
depends=('gtk3' 'libgee' 'libnotify')
makedepends=('vala' 'docbook-xsl' 'libxslt')
source=("http://www.freedesktop.org/software/systemd/$pkgname-$pkgver.tar.xz")
sha256sums=('455e65000abf39bbccd937786b5f0d7c76ea631b6f28d7142f007fa141338dad')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
