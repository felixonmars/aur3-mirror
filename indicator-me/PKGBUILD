# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=indicator-me
pkgver=0.2.90
pkgrel=1
pkgdesc="A menu in the menu bar that represents you, the user, and the things that represent you in the computer"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-me"
license=('GPL')
depends=('libdbusmenu>=0.3.95' 'libindicator>=0.3.0' 'libgwibber>=0.0.7' 'telepathy-glib>=0.9.0' 'ido>=0.1' 'dconf')
true && depends=('libdbusmenu-gtk3>=0.3.95' 'libindicator3>=0.3.0' 'libgwibber>=0.0.7' 'telepathy-glib>=0.9.0' 'ido>=0.1' 'dconf')
makedepends=('intltool>=0.35.0')
options=(!libtool)
install=$pkgname.install
source=(http://launchpad.net/$pkgname/0.3/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('cc28270149d034daee8201e18d507b25')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/indicator3/indicator3-0.4/' configure{,.ac}

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
