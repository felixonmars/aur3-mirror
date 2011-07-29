# Contributor: Rorschach <r0rschach@lavabit.com>
# Contributor: Andrew Kravchuk <awkravchuk@gmail.com>
# Contributor: aericson <de.ericson@gmail.com>

pkgname=aarchup
pkgver=1.6.4
pkgrel=1
pkgdesc="Fork of archup a small and lightweight update-notifier for archlinux."
url="https://github.com/aericson/aarchup"
arch=('i686' 'x86_64')
license="GPL"
depends=('pacman' 'libnotify' 'gtk2')
makedepends=('libnotify' 'autoconf' 'gzip')
source=(https://github.com/downloads/aericson/aarchup/$pkgname-$pkgver.tar.gz)
md5sums=('94ffddda9f965b0f7f23667d3e16f0f8')
optdepends=('cower: AUR support(--aur)')
install=('aarchup.install')

build() {
	cd $pkgname-$pkgver/src
	autoconf || return 1
	./configure || return 1
	make || return 1
	make DESTDIR=$pkgdir install
}
