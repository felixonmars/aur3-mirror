#Maintainer: Niklas Schnelle <niklas@komani.de>
#Contributor: Niklas Schnelle <niklas@komani.de>
#Author: Niklas Schnelle <niklas@komani.de>

pkgname=lotse
pkgver=0.1
pkgrel=1
pkgdesc="A small application for geocaching written in Python"
arch=(any)
url="http://github.com/konne88/Lotse"
license=("GPL")
depends=('python' 'pygtk' 'gpsd>=2.94git20100603-1')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)

source=(http://github.com/downloads/konne88/Lotse/$pkgname-$pkgver.tar.gz)
md5sums=('82e04e4c492da8d5d5405f527e37b640')

build() {
  cd $srcdir/$pkgname-$pkgver 
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1

  # Remember to install licenses if the license is not a common license!
  # install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
