# Maintainer: RISKO Gergely <risko@debian.org>
# Contributor: Daneel <aur@gnoulibre.org>

pkgname=bombardier-git
pkgver=20100301
pkgrel=1
pkgdesc="Bombardier is The GNU Bombing utility"
arch=(i686 x86_64)
url="http://git.debian.org/?p=collab-maint/bombardier.git;a=summary"
license=('GPL3')
depends=('ncurses')
makedepends=('git' 'gcc')
conflicts=('bombardier')
source=()
md5sums=()

_gitroot="git://git.debian.org/collab-maint/bombardier.git"

build() {
	msg "Connecting to GIT server..."
	if [[ -d $srcdir/$pkgname-$pkgver ]]; then
		cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
	else
		git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
		cd $srcdir/$pkgname-$pkgver
	fi
	msg "GIT checkout done or server timeout"

	make || return 1
	sed -i 's_/usr/games_/usr/bin_g' Makefile
	make DESTDIR=$pkgdir install
}

