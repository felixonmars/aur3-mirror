# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=gaphas
pkgver=0.7.2
pkgrel=3
pkgdesc="A GTK+ based diagramming widget written in Python"
arch=('any')
url="http://gaphor.sourceforge.net"
license=('LGPL')
depends=('pygtk' 'python2-decorator' 'python2-simplegeneric')
makedepends=('python2-distribute' 'python2-nose')
source=("http://pypi.python.org/packages/source/g/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('8a18fa17a7f4df29d9e7762eb430816e')

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir/"
}