# $Id: PKGBUILD 38529 2011-01-27 20:56:07Z jlichtblau $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Hugo Ideler <hugoideler@dse.nl>

pkgname=libstatgrab-ext4
realname=libstatgrab
pkgver=0.17
pkgrel=1
pkgdesc="A library that provides cross platform access to statistics about the system on which it's run - patched for ext4 Support"
arch=('i686' 'x86_64')
url="http://www.i-scream.org/libstatgrab"
license=('LGPL' 'GPL')
depends=('ncurses' 'perl')
provides=("$realname")
conflicts=("$realname")
options=('!libtool' '!makeflags')
changelog=$realname.changelog
source=(http://www.mirrorservice.org/sites/ftp.i-scream.org/pub/i-scream/$realname/$realname-$pkgver.tar.gz
ext4.patch)
sha256sums=('bbaa88c6bde8bd3cf2720b81a26528cc055a7e83e4ea3bdb1d0a3c4287cceb88'
'8323d45e25d46dcea04ac0882ec789f1a0baaeda3a471f94d25ff1598a0e0964')

build() {
  cd ${srcdir}/$realname-$pkgver/src/libstatgrab
  patch < ../../../ext4.patch
  cd ../../
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$realname-$pkgver

  make DESTDIR=${pkgdir} install
}
