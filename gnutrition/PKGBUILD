# Maintainer: Brandon Invergo <brandon@invergo.net>
pkgname=gnutrition
pkgver=0.32
pkgrel=1
pkgdesc="Free nutrition analysis software"
arch=('any')
url="https://www.gnu.org/software/gnutrition/"
license=('GPL3')
groups=()
depends=('python2' 'pygtk')
install=$pkgname.install
source=(http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('88cf50eabe7b4f395643fa89887a0dad')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i '46,47s_${prefix}/gnome/apps/Applications/_${datarootdir}/applications/_' Makefile.in 
  sed -i '1s/python/python2/' run-gnutrition.py.in 

  ./configure prefix=/usr PYTHON=/usr/bin/python2
  make prefix=/usr PYTHON=/usr/bin/python2
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" PYTHON=/usr/bin/python2 install
}

# vim:set ts=2 sw=2 et:
