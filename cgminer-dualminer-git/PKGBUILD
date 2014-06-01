# Maintainer: Carlos Solís <csolisr@inventati.org>

# Contributors by way of cgminer package in arch repos
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: monson <holymonson@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: David Manouchehri <david@davidmanouchehri.com>

# Contributor by way of cgminer-git in AUR
# Contributor: Atterratio <atterratio at gmail>

# Contributor original cgminer-git in AUR
# Contributor: deusstultus <deusstultus@gmail.com>

# Contributor by way of cgminer-dualminer-git
# Contributor: Carlos Solís <csolisr@inventati.org>

pkgname=cgminer-dualminer-git
provides=('cgminer')
_gitname=dualminer-cgminer
_appname=cgminer
epoch=1
pkgver=9.31cb5fc
pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
pkgrel=1
pkgdesc="Multi-threaded multi-pool GPU, FPGA and ASIC miner for bitcoin and derivative coins. Added support for DualMiner."
url='https://github.com/dualminer/dualminer-cgminer'
license=('GPL3')
#Note license was GPL2 prior to Tue Feb 21 22:23:07 2012 +1100 if playing with old versions with this PKGBUILD
arch=('i686' 'x86_64')
depends=('curl' 'libusbx' 'jansson')
conflicts=('cgminer' 'cgminer-git' 'cgminer-git-adl')
makedepends=('git' 'patch' 'autoconf' 'automake' 'binutils' 'pkg-config' 'gcc' 'libtool' 'make')
optdepends=('ncurses: For ncurses formatted screen output')
source=("git+https://github.com/dualminer/dualminer-cgminer.git"
        "$_appname.conf.d::https://projects.archlinux.org/svntogit/community.git/plain/trunk/cgminer.conf.d?h=packages/cgminer"
        "$_appname.service::https://projects.archlinux.org/svntogit/community.git/plain/trunk/cgminer.service?h=packages/cgminer")
sha512sums=('SKIP'
            '99c38bc395848f9712ce172343d31f5c60f5d8ac1cfe2f48df8f3ec6c488fc275763a79c5ef36b99f32faa465b5a65284b38e8a63ef9b144075ee13971313b41'
            '3317b60c6b1f14c47d8ee636113ef40a4023ab14054129de80a37947b381fd2b647a7053f4e1bb639efa225a514e862fa531908714c34040dda2d6221dde7f5f')

backup=("etc/conf.d/$_appname" "etc/$_appname.conf")
[ "$CARCH" == "x86_64" ] && makedepends+=('yasm')

build() {
  cd "$srcdir/$_gitname"

  # This repository comes without the execution bit activated for these two.

  chmod +x ./autogen.sh
  chmod +x ./configure

  NOCONFIGURE=1 ./autogen.sh

  # Here you may want to use custom CFLAGS
  export CFLAGS="-O2 -march=native -mtune=native -msse2"

  ./configure \
    --prefix=/usr \
    --enable-avalon \
    --enable-bflsc \
    --enable-bitfury \
    --enable-bitforce \
    --enable-icarus \
    --enable-modminer \
    --enable-dualminer \
    --enable-scrypt

  make
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$_appname.service "$pkgdir"/usr/lib/systemd/system/$_appname.service
  install -Dm644 "$srcdir"/$_appname.conf.d "$pkgdir"/etc/conf.d/$_appname
  sed 's#/usr/local/bin#/usr/bin#g' example.conf > $_appname.conf
  install -Dm644 $_appname.conf "$pkgdir"/etc/$_appname.conf
  
  # The repository bundles several compiled files that conflict with preinstalled packages.

  cd "$pkgdir/$_pkgname"
  rm "./usr/include/jansson.h"
  rm "./usr/include/jansson_config.h"
  rm "./usr/include/libusb-1.0/libusb.h"
  rm "./usr/lib/libusb-1.0.so"
  rm "./usr/lib/pkgconfig/libusb-1.0.pc"

}
