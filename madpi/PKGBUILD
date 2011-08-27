# vim:set ts=2 sw=2 et:
# Maintainer: Thayne McCombs <astrothayne@gmail.com>
pkgname=madpi
pkgver=1.0.1
pkgrel=1
pkgdesc="simple interactive program to make funny stories"
arch=('any')
url="https://sourceforge.net/projects/madpi"
license=('GPL')
depends=('python')
makedepends=('docbook-xsl')
backup=('usr/share/madpi/madpi.cfg')
options=(!emptydirs)
source=("madpi-$pkgver.tar.gz")

package() {
  cd "$srcdir/madpi-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}

md5sums=('106ac67ed81c2411740be2db3420a9f2')
