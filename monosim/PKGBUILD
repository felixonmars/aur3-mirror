# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=monosim
pkgver=1.5.2
pkgrel=1
pkgdesc='Manage your sim card contacts with standard pcsc smartcard reader'
arch=('i686' 'x86_64')
url='http://www.integrazioneweb.com/monosim/'
license=('GPL')
depends=('mono' 'gtk-sharp-2')
source=("http://www.integrazioneweb.com/repository/sources/$pkgname-$pkgver.tar.gz")
md5sums=('0a842f8443f04680efbdc9dacacb1ce0')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"

  make DESTDIR="${pkgdir}" install
}
