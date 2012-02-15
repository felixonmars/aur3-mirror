# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=notecase
pkgver=1.9.8
pkgrel=5
pkgdesc="A portable hierarchical note manager, coded in C++ using the GTK+ toolkit"
arch=('i686' 'x86_64')
license=('BSD')
url="http://notecase.sourceforge.net"
depends=('gnome-vfs' 'gtksourceview2' 'desktop-file-utils')
makedepends=('bc')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver}_src.tar.gz"
        'snprintf-gtksourceview-debsize.patch')
md5sums=('9fe7d2db959d4c457d53313bb8faac35'
         '3b9501156c1137143d79c930cce03aba')
install=notecase.install

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/snprintf-gtksourceview-debsize.patch"
	LDFLAGS='-lX11' make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	LDFLAGS='-lX11' make prefix="$pkgdir/usr" install
	install -Dm 644 "docs/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
