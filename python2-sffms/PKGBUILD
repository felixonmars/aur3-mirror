# Maintainer: Elena Grandi <elena.valhalla@gmail.com>
pkgname=python2-sffms
pkgver=0.9.4
pkgrel=1
pkgdesc="Sffms-style LaTeX output for Sphinx"
arch=(any)
url="https://github.com/evangoer/sphinx_dev/tree/master/sffms"
license=('BSD')
groups=()
depends=('python2' 'python2-sphinx' 'texlive-latexextra')
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/s/sffms/sffms-$pkgver.tar.gz)
md5sums=('04e003d9ed7a15db04dba13b57f05b9a')

package() {
  cd "$srcdir/sffms-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
