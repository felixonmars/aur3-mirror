# Maintainer: Veli-Jussi Raitila <vjr AT iki DOT fi>

pkgname=python2-pyhyphen
_pkgname=PyHyphen
pkgver=2.0.5
pkgrel=1
pkgdesc="Hyphenation library for Python"
arch=('x86_64' 'i686')
url="https://code.google.com/p/pyhyphen/"
license=('GPL2' 'LGPL2.1' 'MPL')
depends=('python2')
install=pyhyphen.install

source=(http://pypi.python.org/packages/source/P/${_pkgname}/pyhyphen-${pkgver}.zip)
md5sums=('2e797270170c8681eba77e38ed12e389')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  sed -i \
    -e 's|\$path|/usr/lib/python2.7/site-packages/hyphen|' \
    -e 's|\$repo|http://cgit.freedesktop.org/libreoffice/dictionaries/plain/|' \
    2.x/config.py

  sed -i "s|'install' in sys.argv|False|" setup.py

  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
