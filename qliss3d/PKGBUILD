# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=qliss3d
pkgver=1.4
pkgrel=1
pkgdesc="Renders 3D Lissajous figures with a Qt interface."
arch=(i686 x86_64)
url="http://qliss3d.sourceforge.net/"
license=('GPL')
depends=('qt')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        "lissajous.png::http://upload.wikimedia.org/wikipedia/commons/8/88/Lissajous_8_21_Knot.png"
        "$pkgname.desktop")
md5sums=('2f9ab644b24141463dfdae94d9fbd98f'
         '736ec92e643994101be827ee7236d5ec'
         '373ee9eb5cab7d111b62ba8d64c7e261')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # desktop and pixmaps
  install -Dm644 "$srcdir/$pkgname.desktop" \
                 "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 "$srcdir/lissajous.png" \
                 "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
