# Tsekhovoy Eugene aka Krash <8552246@gmail.com>

pkgname='dwm-krash-hg'
pkgver=1521
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'dmenu' 'rxvt-unicode')
makedepends=('mercurial')
conflicts=('dwm' 'dwm-hg')
provides=('dwm')
source=('config.h')
md5sums=(3206a03e736dbcce7486a6c8bf3f1e00)

_hgroot='http://code.suckless.org/hg'
_hgrepo='dwm'

build() {
	cd ${srcdir}

	msg "Connecting to the hg repository..."
	if [ -d ${_hgrepo} ]; then
		cd ${_hgrepo}
		make clean
		hg pull -u
	else
		hg clone ${_hgroot}/${_hgrepo}
		cd ${_hgrepo}
	fi
	msg "HG checkout done or server timeout"

  cp ${srcdir}/config.h config.h

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 || return 1
  make PREFIX=/usr DESTDIR=$pkgdir install || return 1

  install -m644 -D LICENSE $pkgdir/usr/share/licenses/dwm/LICENSE && \
  install -m644 -D README $pkgdir/usr/share/doc/dwm/README
}
