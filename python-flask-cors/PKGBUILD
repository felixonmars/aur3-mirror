# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python-flask-cors
pkgname=python-flask-cors
_pkgname=Flask-Cors
pkgver=2.0.1
pkgrel=1
pkgdesc="A Flask extension adding a decorator for CORS support"
arch=('any')
url='https://pypi.python.org/pypi/Flask-Cors'
license=('')
depends=('python')
options=(!emptydirs)
        # hhttps://pypi.python.org/packages/source/F/Flask-Cors/Flask-Cors-1.3.1.tar.gz
source=("https://pypi.python.org/packages/source/F/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('ca5b9c19878d600f18286fc0f60a4469')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
