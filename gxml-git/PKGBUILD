# Maintainer: Celedhrim <celed+archlinux@ielf.org>
pkgname=gxml-git
pkgver=0_4_1.r19.g890c31e
pkgrel=1
pkgdesc='a GObject API that wraps around libxml2.'
url='https://github.com/GNOME/gxml'
arch=('i386' 'x86_64')
license=('GPL')
depends=('libxml2' 'libgee')
makedepends=('git' 'gcc' 'gettext' 'libunistring' 'vala' 'libgee' 'libxml2' 'intltool' 'gobject-introspection')
provides=('gxml-git')
source=('gxml-git::git+https://github.com/GNOME/gxml.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
		git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/GXML_//g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	sed -i 's/\/doc\/gxml/\/share\/doc\/gxml/g' Makefile
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
