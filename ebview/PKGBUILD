# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: muflax <muflax@gmail.com>

pkgname=ebview
pkgver=0.3.6
pkgrel=1
pkgdesc="A GTK-based EPWING dictionary viewer"
arch=('i686' 'x86_64')
url="http://ebview.sourceforge.net/"
license=('GPL')
depends=('eb-library' 'gtk2' 'pangox-compat')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver.diff)
sha256sums=('4c8ce9d9b1567b5dd7c23cb157a864f99ee8266637ab0b8c99f3dfcd963133b1'
            '96e1714d4db89e0c20b71a2444d3a41dee9b8e3b8555d17eafd47f8662cae211')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver.diff
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    CFLAGS="-D_FILE_OFFSET_BITS=64" \
    LIBS=-lX11
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
