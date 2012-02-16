# Maintainer: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=unionfs-fuse
pkgver=0.25
pkgrel=1
pkgdesc="A user space unionfs implementation"
arch=('i686' 'x86_64')
url="http://podgorny.cz/moin/UnionFsFuse"
license=('custom')
depends=('fuse')
makedepends=('cmake')
source=(http://podgorny.cz/unionfs-fuse/releases/$pkgname-$pkgver.tar.bz2)
md5sums=('740be672ae1b3ade4ee19dee9fbfd124')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  # install license
  install -Dm644 $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
