# Maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>"

pkgname=python2-dumb
pkgver=0.4.0
pkgrel=2
pkgdesc="minimalist and DVCS compatible bookmark manager."
arch=(any)
url="http://dumb.grys.it"
license=('LGPL3')
depends=('python2' 'python2-yaml')
backup=()
conflicts=('dumb-bookmarks')
source=(http://dumb.grys.it/_downloads/dumb-$pkgver.tar.gz)
md5sums=('b3439a971cffaf9b2a1ed23ca926711f')
options=(!emptydirs)
install=

build() {
  cd $srcdir/dumb-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}

