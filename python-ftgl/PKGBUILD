# Contributor: Ryan Coyner <rcoyner@gmail.com>
pkgname=python-ftgl
pkgver=0.4b
pkgrel=1
pkgdesc='Python bindings to FTGL.'
arch=('i686')
url='http://xcb.freedesktop.org/XcbPythonBinding/'
license=('GPL')
depends=('boost' 'ftgl' 'python')
source=(http://cgit.freedesktop.org/xcb/xpyb/snapshot/xpyb-$pkgver.tar.gz)
source=(http://pyftgl.googlecode.com/files/PyFTGL-$pkgver.tar.gz)
md5sums=('fd2a49e93f973a2cbea45783e672c31d')

build() {
    cd $srcdir/PyFTGL-$pkgver
    python setup.py build || return 1
    python setup.py install --root=$pkgdir || return 1
}
