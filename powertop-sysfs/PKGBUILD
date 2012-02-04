# $Id: PKGBUILD 24103 2010-08-19 22:45:29Z heftig $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Xilon <xilonmu@gmail.com>

# Maintainer: Lukas Barth <mail@tinloaf.de>
pkgname=powertop-sysfs
pkgver=1.13
pkgrel=2
pkgdesc="Powertop 1 fixed to work with sysfs and 3.0.6 kernel"
arch=('i686' 'x86_64')
url="http://www.lesswatts.org/projects/powertop/"
license=('GPL2')
depends=('ncurses')
conflicts=('powertop')
replaces=('powertop')
source=(http://www.lesswatts.org/projects/powertop/download/powertop-$pkgver.tar.gz
	powertop-$pkgver-with-3.0.6.patch)
md5sums=('78aa17c8f55178004223bf236654298e'
	'2b4c9d75fb0f5c96bcd549bcbbeb9c9d')

build() {
  cd "$srcdir/powertop-$pkgver"
  patch -p1 < ../powertop-$pkgver-with-3.0.6.patch
  make
}

package() {
  cd "$srcdir/powertop-$pkgver"
  make DESTDIR="$pkgdir" install
}
