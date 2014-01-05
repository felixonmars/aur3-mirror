# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme
# Contributor: encelo

pkgname=etk.docking
pkgver=0.2
pkgrel=1
pkgdesc="PyGTK Docking Widgets"
arch=('any')
url="http://pypi.python.org/pypi/$pkgname"
license=('GPL3' 'LGPL3')
depends=('pygtk')
makedepends=('python2-distribute')
provides=('etk-docking')
conflicts=('etk-docking')
replaces=('etk-docking')
source=("http://pypi.python.org/packages/source/e/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ec6249aee6cd210bbdffd7bbe839e0a1')

prepare() {
  cd $pkgname-$pkgver

  # python2 shebang
  find . -name "*.py" -exec \
    sed -i 's/env python/&2/' {} \;
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir/" \
                           --install-data=/usr/share/$pkgname
}
