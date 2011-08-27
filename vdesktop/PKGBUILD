# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=vdesktop
pkgver=0.4.0
pkgrel=2
pkgdesc="QEMU version with support for the SPICE virtual desktop protocol"
arch=('x86_64')
url="http://www.spice-space.org"
license=('GPL')
depends=('kernel26>=2.6.30' 'libspice')
makedepends=('dev86' 'iasl')
provides=('qemu')
conflicts=('qemu')
install=vdesktop.install
source=($url/download/${pkgname}_0_4.tar.bz2)
noextract=()
md5sums=('69d68fa351f890b3536f5ff2f9247c42')

build() {
  cd "$srcdir/$pkgname"

  # Build qemu with kvm and spice support
  ./configure --prefix=/usr --enable-spice || return 1
  cd libkvm
  make || return 1
  cd ../qemu
  make || return 1
  ln -s x86_64-softmmu/qemu-system-x86_64 qemu

  # Build BIOS for qemu. Binaries exist on spice website
  cd "$srcdir/$pkgname/bios"
  make || return 1
  cd ../vgabios
  make || return 1

#  Docs says these are needed but does not seem so
#  ln -s "$srcdir/$pkgname/bios/BIOS-bochs-latest" ../qemu/pc-bios/bios.bin
#  ln -s "$srcdir/$pkgname/vgabios/VGABIOS-lgpl-latest.bin" ../qemu/pc-bios/vgabios.bin

  cd "$srcdir/$pkgname"
  # Workaround to keep 'make install' from doing kernel stuff
  make -C libkvm DESTDIR="$pkgdir/" install
  make -C qemu DESTDIR="$pkgdir/" install
  
}

# vim:set ts=2 sw=2 et:
