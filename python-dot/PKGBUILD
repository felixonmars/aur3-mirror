# Maintainer: Phil Schaf <flying-sheep@web.de>
pkgname=python-dot
pkgver=1.0.28
pkgrel=1
_gitrev=d50464de0078c2b1f5496f297ac88b4d899c1274 #this is a py3ified 1.0.28!
pkgdesc='Python interface to Graphviz’s Dot language'
arch=('any')
url='https://github.com/nlhepler/pydot-py3'
license=('MIT')
depends=('python' 'python-pyparsing' 'graphviz')
makedepends=('setuptools')
source=("$url/archive/$_gitrev.tar.gz")
sha1sums=('599653b233b9e328ba508cb0688dd7e5ac30c1e4')

package() {
  cd "$srcdir/pydot-py3-$_gitrev"

  python setup.py install --install-data='/usr/share/pydot' --root="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}