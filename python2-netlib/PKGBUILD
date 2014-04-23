# Maintainer:  Nicolas Pouillard https://nicolaspouillard.fr

_pypkg=netlib
_python=python2

pkgname=$_python-$_pypkg
pkgver=0.10
pkgrel=1
pkgdesc="A collection of network utilities used by pathod and mitmproxy"
url="https://github.com/mitmproxy/netlib"
license=('MIT')
arch=('any')
depends=("$_python" 'python2-pyasn1' 'python2-pyopenssl')
source=(http://pypi.python.org/packages/source/n/$_pypkg/$_pypkg-$pkgver.tar.gz)
sha256sums=('415e3db96f487177f372d47bc669dcc9068a435e49b8120ec8821026de36bd80')

package() {
  cd "$srcdir/$_pypkg-$pkgver"
  $_python setup.py install --root="$pkgdir"
}
