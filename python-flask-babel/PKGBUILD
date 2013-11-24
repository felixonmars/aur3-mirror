# based on python2-flask-babel
# Contributor: djanku <djanku (at) email (dot) cz>

pkgname=python-flask-babel
pkgver=0.9
pkgrel=1
pkgdesc='Adds i18n/l10n support to Flask applications with the help of the Babel library.'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Babel/'
license=('BSD')
depends=('python-flask' 'python-babel>=1.0' 'python-speaklater>=1.2' 'python-jinja>=2.5')
makedepends=('python-setuptools')
source=("https://github.com/mitsuhiko/flask-babel/archive/$pkgver.tar.gz")
sha256sums=('cef50333533058bfb0f0b8980e63f8f5d38776ecf55d24e6fb547a48af0cf1b5')

package() {
  cd "$srcdir/flask-babel-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
