# Maintainer: Enric Morales <geekingaround@enric.me>
pkgname=cnacl-git
pkgver=20130828
pkgrel=2
pkgdesc="A fork of NaCl, a crypto library. Git version."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/cjdelisle/cnacl"
license=('Public Domain')
depends=()
makedepends=('cmake' 'git')
replaces=('libnacl')
source=()
md5sums=()

_gitname=cnacl
_gitroot=https://github.com/cjdelisle/cnacl.git

prepare() {
	msg "Connecting to GIT server...."
	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting prepare..."

	test -d "$srcdir/cnacl-build" && rm -rf cd "$srcdir/cnacl-build"
	mkdir "$srcdir/cnacl-build"
	cd "$srcdir/cnacl-build"
	cmake "$srcdir/$_gitname/"
}

build() {
	msg "Starting build..."
	cd "$srcdir/cnacl-build"
	make
}

package() {
	cd "$srcdir/cnacl-build"
	install -vd $pkgdir/usr/include/nacl/
	install -D -v $srcdir/cnacl-build/include/*.h \
		"$pkgdir/usr/include/nacl/"

	install -vd "$pkgdir/usr/lib/"
	install -v "$srcdir/cnacl-build/libnacl.a" "$pkgdir/usr/lib/"
}
