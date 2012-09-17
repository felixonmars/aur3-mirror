pkgname=python-dockmanager
pkgreal=dockmanager
pkgver=0.1.0
pkgrel=2
pkgdesc="Python dockmanager API"
url="https://launchpad.net/dockmanager"
arch=(i686 x86_64)
license=(GPL)
depends=(python2)
makedepends=()
conflicts=(dockmanager-bzr dockmanager)
provides=(dockmanager)
source=("http://launchpad.net/dockmanager/trunk/0.1.0/+download/dockmanager-0.1.0.tar.gz" "compil.py")
md5sums=('52a1c833a8f3599156dc00cd52ca624a' 'b4e2f297ebdd23fa6e5ecd56a5974066')

build() {
  cd "$srcdir/$pkgreal-$pkgver"
}

package() {
  cd "$srcdir/$pkgreal-$pkgver"

  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/dockmanager
  cp scripts/dockmanager/*.py $pkgdir/usr/lib/python2.7/site-packages/dockmanager
  cd $pkgdir/usr/lib/python2.7/site-packages/dockmanager
  python2 -O $srcdir/../compil.py

  find $pkgdir -type f -exec sed -i '1s|#!/usr/bin/env python$|&2|' {} +
}
