# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Leif Middelschulte <leif dot middelschulte at gmail dot com>

pkgname=clouseau
pkgver=0.2.1
pkgrel=1
pkgdesc="Evas/Edje (EFL) introspection utility"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary<1.10.99')
makedepends=('git')
source=("git://git.enlightenment.org/tools/$pkgname.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" ChangeLog NEWS README

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING COPYING.icons
}
