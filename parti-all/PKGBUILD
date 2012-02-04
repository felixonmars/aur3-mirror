# Contributor: Bug <bug2000@gmail.com>
# Contributor: Maintainer <bug2000@gmail.com>
# Contributor: Florian Zeitz <florob@babelmonkeys.de>
pkgname=parti-all
pkgver=0.0.6
pkgrel=2
pkgdesc="parti a tabbing/tiling window manager and xpra screen for X"
arch=('i686' 'x86_64')
url='http://partiwm.org'
license=('GPL2')
depends=('python2' 'gtk2' 'pygtk' 'pyrex' 'libxtst' 'xorg-server-xvfb'
'python-gobject2')
makedepends=('setuptools')
source=("http://partiwm.googlecode.com/files/parti-all-$pkgver.tar.gz")
md5sums=('4d246842a4c9061baab3ed6b4de91ab1')

build() {
  cd ${srcdir}/parti-all-$pkgver
  python2 make_constants_pxi.py wimpiggy/lowlevel/constants.txt wimpiggy/lowlevel/constants.pxi
  python2 setup.py build || return 1
  python2 setup.py install --root=${pkgdir} || return 1
}
