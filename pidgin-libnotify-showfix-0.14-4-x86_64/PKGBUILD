# Maintainer: dtomasiewicz <dtomasiewicz+Arch [at] gmail [dot] com>

_pkg=pidgin-libnotify
pkgname=$_pkg-showfix
pkgver=0.14
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Patched pidgin-libnotify to fix the Show button"
url="http://gaim-libnotify.sourceforge.net/"
license=('GPL')
depends=('pidgin' 'libnotify' 'perlxml' 'gettext' 'notification-daemon')
makedepends=('libtool' 'intltool')
replaces=('gaim-libnotify')
conflicts=('pidgin-libnotify' 'pidgin-libnotify-ubuntu' 'pidgin-libnotify-notify-osd')
options=(!libtool)
source=(http://downloads.sourceforge.net/sourceforge/gaim-libnotify/$_pkg-$pkgver.tar.gz
	language_fixes.patch
	pidgin-libnotify-0.14-libnotify-0.7.patch
	show_button_fix.patch)
md5sums=('bfb5368b69c02d429b2b17c00a6673c0'
         'e9bdbb3c7faa61f062fc64277457b6c0'
         '05538625f14d9f2c12adae5fa6a1fa26'
         '8702f68b959d877ddbc44284ed4296b5')

build() {
  cd "$srcdir/$_pkg-$pkgver"
  patch -p1 -i "$srcdir/language_fixes.patch"
  patch -p0 -i "$srcdir/pidgin-libnotify-0.14-libnotify-0.7.patch"
  patch -p1 -i "$srcdir/show_button_fix.patch"
  ./configure --prefix=/usr --disable-deprecated  --disable-static
  make
  make DESTDIR="$pkgdir" install
}
