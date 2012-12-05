# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Oliver Sherouse <first DOT last AT gmail DOT com>
_pkgname=relaxml
pkgname=python2-$_pkgname
pkgver=0.1.3
pkgrel=1
pkgdesc="Converting XML to a dictionary should be easy -- and fast."
arch=('any')
url="https://github.com/zachwill/relaxml"
license=('custom')
depends=('python2')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/r/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('c4d920398b612aa761abdac3968b5a71')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
