# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=ncrypt
pkgver=0.7.0
pkgrel=1
pkgdesc="NMRC File Encryptor / Decryptor / Wiper"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ncrypt/"
license=('GPL')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('423d6d0fb607d63dce788f11f74cb59f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

