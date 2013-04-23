# Maintainer: David López <david dot lopez at upct dot es>

pkgname=indicator-ubuntuone
pkgver=1.0.6
pkgrel=2
pkgdesc="An indicator displaying current Ubuntu One synchronization state"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-ubuntuone"
license=('GPL')
depends=('vala' 'libgee' 'libgee06' 'libappindicator3' 'libsoup' 'json-glib' 'libnotify' 'liboauth' 'xdg-utils' 'ubuntuone-control-panel')
makedepends=('intltool' 'gobject-introspection')
optdepends=('ubuntu-themes: Ubuntu Mono Icon theme')
options=('!libtool')
install=$pkgname.install
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2)
md5sums=('488111cd82e5d4ed96110d9741b1a1a8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
