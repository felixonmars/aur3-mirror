# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=unity-lens-gwibber
_pkgname=gwibber
pkgver=3.6.0
pkgrel=1
pkgdesc="Microblogging lens for Unity"
arch=('i686' 'x86_64')
url="http://gwibber.com/"
license=('GPL')
depends=('gwibber' 'libunity')
makedepends=('intltool' 'vala')
options=('!libtool')
source=(http://launchpad.net/$_pkgname/${pkgver%.*}/$pkgver/+download/$_pkgname-$pkgver.tar.gz
        gtkspell3-port.patch)
md5sums=('5988e36e9f592c6eca6537ba6878307a'
         'e8c657543542d8141fdfe4b87a24d7fe')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

 # Port to the new gtkspell3
 patch -Np1 -i "$srcdir/gtkspell3-port.patch"

  autoreconf -fi
  intltoolize --force
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_pkgname \
              --disable-static --disable-schemas-compile --enable-unity
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make -C lens DESTDIR="$pkgdir" install
}
