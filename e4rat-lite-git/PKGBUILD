# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=e4rat-lite-git
_gitname=e4rat-lite
pkgdesc="e4rat-lite is an improved version of e4rat, a toolset to accelerate the boot process as well as application startups."
url=https://github.com/LaraCraft304/$_gitname
pkgver=2.7.r77.9e0fd8a
pkgrel=5

arch=(i686 x86_64)
license=('GPL')
depends=('e2fsprogs>=1.41' 'gettext>=0.18' 'man-db' 'boost-libs')
makedepends=('git' 'audit' 'cmake' 'boost' 'perl')
optdepends=('bootchart: A "startup" graphing tool')

provides=('e4rat-lite=${pkgver}')
conflicts=('ureadahead' 'e4rat-preload-lite' 'e4rat-preload-lite-git' 'e4rat-lite')
conflicts+=('e4rat')

options=(!strip)

source=("git://github.com/LaraCraft304/$_gitname.git"
        "$pkgname.install")

md5sums=('SKIP'
         '1f6f029eab1d4876cb01765bcc4cf44d')
         
install=$pkgname.install

pkgver() {
  cd "$srcdir"/$_gitname
  printf "2.7.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir"
	
	if [ -d "${pkgname}-build" ]; then
		rm -rf ${pkgname}-build/*
	else
		mkdir ${pkgname}-build
	fi
}

build() {
	cd "$srcdir"/${pkgname}-build
	
	cmake "$srcdir"/$_gitname -DCMAKE_BUILD_TYPE=release \
	                          -DCMAKE_INSTALL_PREFIX="/usr"
	
	make
	
	rm -rf "$srcdir"/$_gitname/lib${pkgname}-core.a
}

package() {
	cd "$srcdir/${pkgname}-build"
	
	make DESTDIR="$pkgdir" install
	
	mkdir -p "$pkgdir/usr/share/doc/e4rat-lite/"
	
	install -m644 "$srcdir"/$_gitname/README* "$pkgdir"/usr/share/doc/${pkgname%-*}/
	install -m644 "$srcdir"/$_gitname/LICENSE* "$pkgdir"/usr/share/doc/${pkgname%-*}/
}
