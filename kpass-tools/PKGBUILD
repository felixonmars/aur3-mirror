# $Id$
# Maintainer: Brian De Wolf <arch@bldewolf.com>
pkgname=kpass-tools
pkgver=6
pkgrel=1
pkgdesc="kpass-tools is a set of experimental tools for using KeePass 1.x databases."
url="https://github.com/bldewolf/kpass-tools"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libkpass' 'util-linux')
makedepends=('pkgconfig' 'intltool')
conflicts=()
replaces=()
backup=()
source=(https://github.com/bldewolf/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('81e7895326d7b00db3b4137e78a0bfe0')
build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}

