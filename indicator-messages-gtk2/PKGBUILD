# Maintainer: György Balló <ballogy@freestart.hu>
_pkgname=indicator-messages
pkgname=indicator-messages-gtk2
pkgver=0.5.0
pkgrel=1
pkgdesc="A place on the user's desktop that collects messages that need a response (GTK+ 2 library for Xfce/LXDE)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-messages"
license=('GPL')
depends=('indicator-messages' 'libindicator>=0.3.19' 'libdbusmenu-gtk2>=0.3.94')
makedepends=('intltool>=0.35.0')
options=(!libtool)
source=(http://launchpad.net/$_pkgname/0.5/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('48ab966fa16a8890e53c2ae7582ac918')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_pkgname \
              --disable-static --with-gtk=2
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make -C src DESTDIR="$pkgdir/" install-messaginglibLTLIBRARIES
}
