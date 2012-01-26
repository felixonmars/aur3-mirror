# Maintainer: Paweł Tarasiuk <pablo.t89@gmail.com>
pkgname=nautilus-clamscan
pkgver=0.2.2
pkgrel=1
pkgdesc="Antivirus scanning for Nautilus"
arch=('i686' 'x86_64')
url="https://launchpad.net/nautilus-clamscan"
license=('GPL')
depends=('python2' 'python-nautilus' 'pygtk' 'pyclamav')
source=(http://launchpad.net/nautilus-clamscan/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('4fc22256b06dbce2b9360cf1e2448959')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p "$pkgdir/usr/lib/nautilus/extensions-2.0/python/"
  (echo '#!/usr/bin/env python2' && tac "nautilus-clamscan.py" | head -n-1 | tac) > "$pkgdir/usr/lib/nautilus/extensions-2.0/python/nautilus-clamscan.py"
}
