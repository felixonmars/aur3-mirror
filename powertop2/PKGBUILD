# $Id: PKGBUILD 24103 2010-08-19 22:45:29Z heftig $
# Maintainer: Lukas Barth <mail+aur@tinloaf.de>
# Former Maintainaer: Mika Hynnä <igheax gmail com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Xilon <xilonmu@gmail.com>

pkgname=powertop2
pkgver=1.98
pkgrel=6
pkgdesc="Tool that finds the software that makes your laptop use more power than necessary. Beta release."
arch=('i686' 'x86_64')
url="http://www.kernel.org/pub/linux/status/powertop/"
license=('GPL2')
depends=('libnl' 'ncurses' 'zlib')
source=(http://ftp.osuosl.org/pub/linux/status/powertop/powertop-$pkgver.tar.bz2
	powertop-1.98-sysfs.patch
	Makefile.patch)

build() {
  cd "$srcdir/powertop-$pkgver"
  patch -p1 < ../powertop-1.98-sysfs.patch
  patch -p1 < ../Makefile.patch
  make
}

package() {
  cd "$srcdir/powertop-$pkgver"
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/bin/powertop" "$pkgdir/usr/bin/powertop2"
}
md5sums=('c1a1bec9a0ddf14e46c176693d4dff8e'
	'331057d4198a5913ece0b8bddea63e87'
	'6f6e9a63e7acc907b1130705e10575d6')
