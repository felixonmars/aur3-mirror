# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=kid
pkgver=0.9.6
pkgrel=5
pkgdesc="A simple template language for XML based vocabularies written in Python"
arch=('any')
url="https://pypi.python.org/pypi/kid"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/k/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4233e592eee906039ad3dcbedbf6e972')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  python2 setup.py install --root="${pkgdir}"

#License
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}
