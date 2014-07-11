# Maintainer: Dave Reisner <d at falconindy dot com>
# Contributor: Oliver Herold <oliver - at - akephalos - dot - de>

pkgname=netpgp
pkgver=20140220
pkgrel=1
pkgdesc="A library for managing PGP keys"
arch=('i686' 'x86_64')
url="http://pkgsrc.se/security/netpgp"
license=('BSD')
depends=('bzip2' 'glibc' 'openssl' 'zlib')
provides=('libmj.so' 'libnetpgp.so')
source=("http://ftp.netbsd.org/pub/pkgsrc/distfiles/LOCAL_PORTS/$pkgname-$pkgver.tar.gz")
md5sums=('b7084dfe9eae3df564972b1a8bd30470')

build() {
  cd "$pkgname-$pkgver"

  ./configure \
      --prefix=/usr

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
