# Maintainer: Simon Chabot <simon dot chabot at fiabilipy dot org>
# Maintainer: Akim Sadaoui <akim dot sadaoui at fiabilipy dot org>
pkgname=fiabilipy
pkgver=2.7
pkgrel=1
pkgdesc="A reliability engineering sofware with educational purposes"
arch=('any')
url="http://fiabilipy.org"
license=('GPL')
depends=('python2-scipy' 'python2-numpy' 'python2-sympy' 'python2-networkx')
optdepends=('graphviz: draw the reliability diagrams'
            'python2-matplotlib: plot the computed probabilities')
provides=('fiabilipy=2.7')
changelog=ChangeLog
source=(https://pypi.python.org/packages/source/f/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('dc7419fe639b951688535baeea325d0b11a313ff909fa346c992decef8fa8ba10d7534345fd194c23fd12dcd066b4ac8d3465d75255b3a62c4ac11df13887144')


package() {
	cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
