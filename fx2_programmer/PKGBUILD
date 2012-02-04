# Contributor: Nate Rhodes  <nate.rhodes at gmail.com>
# Created:     January 2008

pkgname=fx2_programmer
pkgver=2.0.2
pkgrel=1
pkgdesc="A small utility to access the Cypress Semiconductor CY7C68013 chip."
arch=('i686')
url="http://volodya-project.sourceforge.net/fx2_programmer.php"
license=('LGPL')
depends=('freeglut' 'fftw' 'libusb')
source=("http://downloads.sourceforge.net/volodya-project/$pkgname-$pkgver.tgz")
md5sums=('ff2878e900b6cbae427320e54e94f28d')

build() {
  # Go to source dir
  cd "$startdir/src/$pkgname"

  # Set up the "install" directories
  mkdir -p "$startdir/pkg/usr/bin"

  # Update 'install' rule to put binaries in right place
  sed -i.orig "s|\${PREFIX}/bin/|$startdir/pkg/usr/bin|g" Makefile 

  # Build the binaries
  make || return 1
  make DESTDIR="$startdir/pkg/usr/bin" install || return 1
}

