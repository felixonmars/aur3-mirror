# Maintainer: Eric Belanger <belanger@astro.umontreal.ca>

pkgname=pydilbert
pkgver=1.0_rc1
pkgrel=1
pkgdesc="Fetch daily dilbert comic"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pydilbert/"
license="GPL"
depends=('pyqt4')
source=(http://pydilbert.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('3134bd770351f0b5e1cabe13528b1108')

build() {
  source /etc/profile.d/qt4.sh
  cd $startdir/src/$pkgname-$pkgver
  sed -i 's|lrelease-qt4|/opt/qt4/bin/lrelease|' setup.py
  sed -i "s|/usr/share/pydilbert/|$startdir/pkg/usr/share/pydilbert/|" setup.py
  python setup.py install --root=$startdir/pkg
}
