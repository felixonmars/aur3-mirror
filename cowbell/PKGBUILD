# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Stefan Husmann <stefan.husmann@t-systems.com>

pkgname=cowbell
pkgver=0.2.7.1
pkgrel=6
pkgdesc="An elegant music organizer"
arch=('i686' 'x86_64')
url="http://www.more-cowbell.org/"
license=('GPL')
depends=('gtk-sharp-2' 'hicolor-icon-theme' 'taglib')
makedepends=('gettext' 'intltool>=0.21' 'pkgconfig>=0.9.0')
options=('!libtool')
install=$pkgname.install
source=(ftp://ftp.uwsg.indiana.edu/linux/gentoo/distfiles/$pkgname-$pkgver.tar.gz)
sha256sums=('6f72a39efdd3322a9a73f76b37c2c350c47ccb5a4d4fa9388edd788086ddde86')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
