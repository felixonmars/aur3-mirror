# Maintainer: Sébastien Leduc <sebastien@sleduc.fr>

pkgname=python2-defusedxml
_realname=defusedxml
pkgver=0.4.1
pkgrel=1
pkgdesc="XML bomb protection for Python stdlib modules"
arch=("any")
url="https://pypi.python.org/pypi/defusedxml"
license=('custom:PSFL')
depends=('python2')
source=("https://pypi.python.org/packages/source/d/defusedxml/$_realname-$pkgver.tar.gz")
md5sums=('230a5eff64f878b392478e30376d673a')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
