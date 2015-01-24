# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname=sphinxcontrib-bibtex
pkgver=0.3.1
pkgrel=1
pkgdesc="A Sphinx extension for BibTeX style citations"
arch=('any')
url="http://sphinxcontrib-bibtex.readthedocs.org"
license=('BSD')
depends=('python2-sphinx' 'python2-pybtex')
makedepends=('git')
source=("http://pypi.python.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('bc066f65b033d328c15845e74f8786b9b69685096355041f09c1f330241d3b6c')

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
