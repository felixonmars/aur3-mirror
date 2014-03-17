# Mantainer: 3ED <krzysztof1987@gmail.com>

pkgname=caja-actions
pkgver=1.7.0
pkgrel=1
epoch=2
arch=('i686' 'x86_64')
pkgdesc="Configures programs to be launched when files are selected in Caja"
url="https://github.com/NiceandGently/caja-actions"
license=('GPL')
makedepends=('intltool' 'yelp-tools' 'mate-common')
depends=('caja' 'libgtop')
install=${pkgname}.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/NiceandGently/caja-actions/archive/v${pkgver}.tar.gz)
sha256sums=('8f87122501be366ed4bd84209b0917f6d89a5336c6b1a8a92386372520f731f0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  NOCONFIGURE=1 ./autogen.sh

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --with-gtk=2 \
    --disable-scrollkeeper 

  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # Remove redundant documentation
  rm -r "$pkgdir/usr/share/doc/"

  find "$pkgdir" -type f -name "*.la" -delete
}
