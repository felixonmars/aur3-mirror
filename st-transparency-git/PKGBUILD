# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Contributor: Evžen Kirillov <actionless.loveless gmail com>
# Maintainer: Christoph Vigano <mail@cvigano.de>

pkgname=st-transparency-git
appname='st'
conflicts=(${appname})
provides=(${appname})
pkgver=20150416.4c7c156
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X with patches for transparency and separate border width.'
arch=('i686' 'x86_64')
pkgrel=1
license=('MIT')
depends=('libxext' 'libxft')
optdepends=('utmp-git: update utmp files')
makedepends=('ncurses' 'git')
url="http://st.suckless.org"
source=(
	git://git.suckless.org/st
	enable_transparency_options.diff
	enable_border_width_options.diff
	config.diff
	config.diff.lcars
	config.diff.light
	config.diff.monovedek
)
md5sums=('SKIP'
         '02f213e2fcc84fe8d8be79b9a3c374ab'
         '9e5e9f62339cb93d31b6fa5eb9806401'
         'SKIP'
         'a86702a9ce1b5a88e109a7fd7a29ff58'
         '0a98972fe4377df541d92677d44bd307'
         'e442ed524a2e31b63e4580f26c422661')

prepare() {
	cd "${srcdir}/${appname}"
	cp config.def.h config.h
	for patch_file in $(ls ${srcdir}/*.diff); do
		echo "==> applying $(basename ${patch_file})"
		patch -i "$patch_file"
	done
}

build() {
	cd $srcdir/$appname
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd $srcdir/$appname
	make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
