# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme
# Contributor: encelo

_name=etk.docking
pkgname=etk-docking
pkgver=0.2
pkgrel=1
pkgdesc="PyGTK Docking Widgets"
arch=('any')
url="http://pypi.python.org/pypi/etk.docking"
license=('GPL3' 'LGPL3')
depends=('pygtk')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/e/$_name/$_name-$pkgver.tar.gz")
md5sums=('ec6249aee6cd210bbdffd7bbe839e0a1')

build() {
  cd "$srcdir/$_name-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" \
                           --install-data=/usr/share/$pkgname

  # python2 fix
  sed -i "s/env python/&2/" `grep -rl "env python" "$pkgdir"`
}
