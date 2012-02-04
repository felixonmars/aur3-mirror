# $Id$
# Maintainer: Brian De Wolf <arch@bldewolf.com>
pkgname=tabler
pkgver=2
pkgrel=1
pkgdesc="Utility to create a text table from delimited text input."
url="https://sourceforge.net/projects/tabler/"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('pkgconfig')
conflicts=()
replaces=()
backup=()
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('38e9df8dec5ea087a5738bc7581ea07b')
build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make || return 1
	make DESTDIR="$pkgdir/" install
}
