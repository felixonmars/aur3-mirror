# Contributor: Oguz Han Asnaz <O.Asnaz@gmx.net>

pkgname=python-yapgvb
pkgver=1.2.3
pkgrel=1
pkgdesc="YAPGVB provides Python bindings to Graphviz, with an intuitive Python interface."
arch=('i686' 'x86_64')
url="http://code.google.com/p/yapgvb/"
license=('BSD')
depends=('graphviz' 'python')
makedepends=('setuptools')
source=(http://yapgvb.googlecode.com/files/yapgvb-$pkgver-source.tar.gz)

md5sums=(54026e871fb9f5de25416f6c62eda064)

build() {
  cd $startdir/src/yapgvb-$pkgver-source
  sed -i.bak -e 's,use_boost = True,use_boost = False,' config_linux2.py
  python setup.py build || return 1
  python setup.py install --root=$pkgdir || return 1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/license
}

# vim:set ts=2 sw=2 et:

