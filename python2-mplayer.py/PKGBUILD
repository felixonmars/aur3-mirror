# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

_appname=mplayer.py
pkgname=python2-"${_appname}"
pkgver=0.7.0
pkgrel=1
pkgdesc="Lightweight and dynamic MPlayer wrapper with a Pythonic API"
arch=('any')
url="http://code.google.com/p/python-mplayer/"
license=('LGPL')
depends=('mplayer' 'python2')
makedepends=('python2-distribute')
optdepends=('python2-pyqt: for Qt integation'
            'pygtk: for GTK integration')
source=("http://pypi.python.org/packages/source/${_appname::1}/${_appname}/${_appname}-${pkgver}.tar.gz")
md5sums=('8440abf66111b3c5437b32e896b0c44e')

build() {
  cd "${srcdir}/${_appname}-${pkgver}"

  python2 setup.py build
}

package() {
  cd "${srcdir}/${_appname}-${pkgver}"

  python2 setup.py install -O1 --root="${pkgdir}"
}
