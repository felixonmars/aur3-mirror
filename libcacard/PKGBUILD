# Maintainer: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Jameson Pugh <imntreal@gmail.com> 

pkgname=libcacard
pkgver=0.1.2
pkgrel=4
pkgdesc="Virtual Smart Card Emulator"
arch=('x86_64' 'i686')
url="http://spice-space.org"
license=('GPL')
options=('!libtool')
depends=('nss')
source=(http://spice-space.org/download/libcacard/$pkgname-$pkgver.tar.bz2)
md5sums=('ca61fd1d7feaa09e37011daac95c0168')
install=libcacard.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/usr/bin/vscclient" "$pkgdir/usr/bin/vscclient-libcacard"
}

# vim:set ts=2 sw=2 et:
