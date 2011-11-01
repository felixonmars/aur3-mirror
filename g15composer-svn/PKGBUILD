# Contributor: Michael Manley <mmanley@nasutek.com>
# Contributor: Jayson Cofell <kerick@shiftedbit.net>
# Contributor: onestep_ua <onestep@ukr.net>

pkgname=g15composer-svn
pkgver=3.3
pkgrel=1
pkgdesc="Composer utility for Logitech G15 keyboard displays."
arch=('i686' 'x86_64')
url="http://g15tools.sourceforge.net/"
license=('GPL')
depends=('libg15-svn' 'libg15render-svn' 'g15daemon-svn')
makedepends=('flex')
conflicts=('g15composer')
source=("http://nasutek.com/~mmanley/libg15/g15composer.tar.bz2")
md5sums=('0c5ec76ba7e2f9466f55f6858abfc2c7')

build() {
  cd "${srcdir}/g15composer"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
