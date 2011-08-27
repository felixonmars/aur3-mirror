# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=savekernel
pkgver=0.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="kernel backup script"
url="http://www.mvkrauss.de/arch.html"
license=('BSD')
depends=('python' 'abs')
source=(http://www.mvkrauss.de/files/$pkgname-$pkgver.tgz)
md5sums=('598c917abc2f64280c90af89f1b1f320')

build() {
  install --mode=755 -D $startdir/src/$pkgname/savekernel.py \
    $startdir/pkg/usr/bin/savekernel || return 1
  install --mode=644 -D $startdir/src/$pkgname/savekernel.1.gz \
    $startdir/pkg/usr/share/man/man1/savekernel.1.gz || return 1
  install  --mode=644 -D $startdir/COPYING \
    $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}

