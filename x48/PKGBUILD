# Maintainer: Eric Waller <eric dot w dot waller at gmail dot com>
# Author: René Herman <rene dot herman at gmail dot com>

pkgname=x48
pkgver=0.6.4
pkgrel=3
pkgdesc="Emulator for the HP-48 S/SX and G/G+/GX scientific calculator"
arch=('i686' 'x86_64')
url="http://x48.berlios.de"
license=('GPL')
depends=('readline' 'libxext')
conflicts=('x48-emulator')
install=$pkgname.install

source=(http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.bz2
        app-defaults.diff
	missingfiles.tar.gz)

md5sums=('700e631f8924a991b35d8a86ce60aab7'
         '94313aad992deb5f5bfd10ffda8c5582'
         '5ea2820013c27152ecde1063bf5a66c9')

build() {
  tar -xvf ../missingfiles.tar.gz
  cd "$srcdir/"

  patch -Np1 -i $srcdir/app-defaults.diff
  cp missingFiles/config.guess .
  cp missingFiles/config.sub .
  cp missingFiles/depcomp .
  cp missingFiles/install-sh .
  cp missingFiles/missing .
  cp missingFiles/COPYING .
  autoreconf
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/"

  make DESTDIR="$pkgdir/" install || return 1

  install -d $pkgdir/usr/share/$pkgname/romdump

  cd romdump
  install -m 644 -t $pkgdir/usr/share/$pkgname/romdump README ROMDump ROMDump.s
}

# vim:set ts=2 sw=2 et:
