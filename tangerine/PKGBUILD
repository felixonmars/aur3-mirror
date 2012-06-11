# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributer: MutantMonkey <mutantmonkey@gmail.com>

pkgname=tangerine
pkgver=0.3.4
pkgrel=1
pkgdesc="An application that allows you to publish music over your local network, using DAAP"
arch=('i686' 'x86_64')
url="https://launchpad.net/tangerine"
license=('GPL')
depends=('mono-zeroconf' 'log4net' 'nini' 'gtk-sharp-2' 'db4o' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool' 'taglib-sharp' 'dbus-sharp-glib')
options=('!libtool')
install=$pkgname.install
source=(https://launchpad.net/tangerine/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz
        dbus-sharp.patch
        db4o-8.0.patch)
md5sums=('d0f677cb00ab638aa3a7673ed8621faf'
         '05d9b053fbd91c831c4fb2551294c766'
         'f29cf5d8e47d72465b001bbe3fd64e0e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 -i "$srcdir/dbus-sharp.patch"
  patch -Np0 -i "$srcdir/db4o-8.0.patch"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
