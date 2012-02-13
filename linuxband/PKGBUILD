# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=linuxband
pkgver=12.02
pkgrel=1
epoch=
pkgdesc="A GUI front-end for MMA"
arch=(i686 x86_64)
url="http://linuxband.org/"
license=('GPL')
depends=('pygtksourceview2' 'jack' 'libsmf'
         'desktop-file-utils' 'mma')
install="$pkgname.install"
source=(${url}assets/sources/$pkgname-$pkgver.tar.gz
        $pkgname.{png,desktop})
md5sums=('a0de5c65d269d51c7857a2cba589d3e5'
         'daa63b901cdb0edcb6953608f9e2cd1e'
         '14fbcc695e5394ad789a30c13e3535b5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # strip off as-needed
  export LDFLAGS="${LDFLAGS/,--as-needed}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # python2 fix
  sed -i 's/env python/&2/' \
   "$pkgdir/usr/bin/$pkgname"

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ../$pkgname.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
