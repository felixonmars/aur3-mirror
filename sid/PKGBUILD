# Contributorr: Imanol Celaya <ilcra1989@gmail.com>
pkgname=sid
pkgver=1.10
pkgrel=1
pkgdesc="SID (Syntax Improving Device) is an LL(1) parser generator."
arch=('i686' 'x86_64')
url="http://www.tendra.org/wiki/SID"
license=('custom')
makedepends=(bmake)
source=(http://www.tendra.org/releases/sid/sid-1.10.tar.gz
        LICENSE)
md5sums=('2b2efdcb72d60a2387eba35fe5a6bac4'
         'e5363c3cc19739fc080b5576e7a620fe')

build() {
  cd $srcdir/$pkgname-$pkgver
  PREFIX=$pkgdir/usr bmake install || return 1
  install -D -m644 $startdir/LICENSE $pkgdir/usr/share/licenses/sid/LICENSE
}

# vim:set ts=2 sw=2 et:
