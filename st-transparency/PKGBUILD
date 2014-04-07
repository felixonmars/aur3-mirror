# Contributor: Patrick Jackson <PatrickSJackson gmail com>
# Contributor: Evžen Kirillov <actionless.loveless gmail com>
# Maintainer: Christoph Vigano <mail@cvigano.de>

pkgname=st-transparency
appname='st'
conflicts=(${appname})
provides=(${appname})
pkgver=0.5
pkgrel=1
pkgdesc='A simple virtual terminal emulator for X with patches for transparency and separate border width.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxext' 'libxft')
makedepends=('ncurses')
url="http://st.suckless.org"
source=(
	http://dl.suckless.org/st/$appname-$pkgver.tar.gz
	enable_transparency_options.diff
	enable_border_width_options.diff
	config.h
)
md5sums=('4f8ae2737120a8cba34b23c6020fe51e'
         'ed8025bef58c1055de3879f469596bc5'
         '22a01b5a79dfd69cf1a522b9309cee69'
         'e5e2a50ee028058baff273438d6a0bc6')

prepare() {
  cd "${appname}-${pkgver}"
  patch -i "${srcdir}/enable_transparency_options.diff"
  patch -i "${srcdir}/enable_border_width_options.diff"
}

build() {
  cp ${srcdir}/config.h $srcdir/$appname-$pkgver/
  cd $srcdir/$appname-$pkgver
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$appname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" TERMINFO="$pkgdir/usr/share/terminfo" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
