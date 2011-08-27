# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=rsyncrypto
pkgver=1.12
pkgrel=2
pkgdesc="sync friendly file encryption"
arch=(i686 x86_64)
url="http://rsyncrypto.lingnu.com/"
license=('GPL')
depends=('argtable' 'gzip-rsyncable')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=(62367d5458ceaab58bbe73030880f538)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
