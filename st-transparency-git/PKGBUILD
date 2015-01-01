# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Contributor: Evžen Kirillov <actionless.loveless gmail com>
# Maintainer: Christoph Vigano <mail@cvigano.de>

pkgname=st-transparency-git
appname='st'
conflicts=(${appname})
provides=(${appname})
pkgver=20141204.9422258
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
         '1a89c3eb7606c9fb627992123747a8b7'
         '9e0fe7d77c8bcfaba3ff8203895cfdfb'
         'SKIP'
         'fe855c9850398d476848c78123cd88c7'
         '0a98972fe4377df541d92677d44bd307'
         '1a14df9693651027320389e7bce35c44')

#pkgver(){
	#cd "${srcdir}/${_appname}"
	#git log -1 --format='%cd.%h' --date=short | tr -d -
#}

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
