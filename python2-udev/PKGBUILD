# Maintainer:  examon <examon.mail[at]gmail[dot]com>
# Contributor: Sebastian Wiesner <lunaryorn googlemail com>
# Contributor: Dwight Schauer <dschauer@ti.com>
pkgname=python2-udev
pkgver=0.15
pkgrel=4
pkgdesc="Python binding for libudev"
arch=('any')
url="http://pyudev.readthedocs.org/"
license=('LGPL')
depends=('python2' 'udev')
conflicts=('pyudev')
replaces=('pyudev')
provides=('pyudev')
makedepends=('python2-distribute')
optdepends=('python2-qt: pyqt4 integration'
            'pyside: pyside integration'
            'python2-gobject2: glib integration'
	    'wxpython: wx integration')
source=("http://pypi.python.org/packages/source/p/pyudev/pyudev-${pkgver}.tar.gz")
md5sums=('35d7295e71664bb630a1fa61ad11d6f6')

build() {
  cd "$srcdir/pyudev-$pkgver"
  python2 setup.py install --root "${pkgdir}" -O1 || return 1
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -m644 CHANGES.rst "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.rst"
}
