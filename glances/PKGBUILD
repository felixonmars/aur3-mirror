# Contributor: Francois Boulogne fboulogne at april dot org
# Maintainer: Francois Boulogne fboulogne at april dot org

pkgname=glances
pkgver=1.4.1.1
pkgrel=1
pkgdesc="CLI curses-based monitoring tool"
arch=('any')
url="https://github.com/nicolargo/glances"
license=('LGPL')
makedepends=()
depends=('python2' 'python2-psutil' 'python2-distribute')
optdepends=('python2-jinja')
source=(https://github.com/downloads/nicolargo/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=("43acf579e3303350844ed3ef2c7d73fa")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix'=/usr' --root="${pkgdir}" 
}

# vim:ts=2:sw=2:et:
