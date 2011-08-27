# Contributor: Aaron Bishop <erroneous@gmail.com>
pkgname=ps3-utils
pkgver=2.2.0
pkgrel=1
pkgdesc="Set of utilities useful for the PS3"
license=(GPL)
arch=(ppc ppc64)
url="http://ftp.kerneli.org/pub/linux/kernel/people/geoff/cell/ps3-utils/"
depends=()
source=(http://ftp.kerneli.org/pub/linux/kernel/people/geoff/cell/ps3-utils/$pkgname-$pkgver.tar.bz2)
md5sums=(7083da6487524955fbd141cc576642a2)
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
