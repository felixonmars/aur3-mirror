# $Id$
# Contributor: Jianing Yang <jianingy.yang@gmail.com>

pkgname=rxvt-unicode-chinese
_pkgname=rxvt-unicode
pkgver=9.20
pkgrel=1
pkgdesc="An unicode enabled rxvt-clone terminal emulator (urxvt) with chinese font-width patch"
arch=(i686 x86_64)
depends=('gcc-libs' 'libxft' 'libxpm')
makedepends=('ncurses' 'perl>=5.10.0' 'pkgconfig')
optdepends=('perl: lots of utilities' 'gtk2-perl: to use the urxvt-tabbed')
conflicts=('rxvt-unicode')
provides=('rxvt-unicode')
url="http://software.schmorp.de/pkg/rxvt-unicode.html"
license=("GPL2")
source=(http://dist.schmorp.de/rxvt-unicode/${_pkgname}-${pkgver}.tar.bz2 \
        ${_pkgname}.desktop \
		${_pkgname}.png \
        popup-menu-hang.diff \
		font-width-fix.patch \
		fullscreen-gap-fix.patch \
		pretty-tab.patch)
md5sums=('4a5b823f08d21036f94a6c51e94d025b' '5bfefa1b41c2b81ca18f2ef847330543'\
         '84328cada91751df07324d95f8be4d1b' \
         'aead33ba3b08eeb251fb0c1427a4a024' 'df0c3a8b6bb0578d1b91e4081c47881c'\
		 '646ac9a097dc873988a8bfb60ff1c554' '5229db8e1138666420aff4372808e5ad')
sha1sums=('6214c7893a8c968936103e255a1d3d1e9868abf9' '79b7cacb7d6ce4a34f8a31a2e33475a8f7bf69cb' \
          '9ff58d7b1d60838c51c9045bc0be342fac456790' \
          'ec4013f4af3a45da928b75f40fbf6389070e7fdd' '01ee8f212add79a158dcd4ed78d0ea1324bdc59b'\
		  'a92be6c8402dcebfeace75268355a0d166cbabc0' '18d42e046ea232b8e873832c448c8d6bb4186339')
install="rxvt-unicode-chinese.install"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # patch -p0 < ../popup-menu-hang.diff || return 1
  # Fix full screen gap
  # patch -p0 < ../fullscreen-gap-fix.patch || return 1
  # Fix font width bug fix
  patch -p0 -i ${srcdir}/font-width-fix.patch || return 1
  # Add 256 color support
  #patch -p1 -i doc/urxvt-8.2-256color.patch || return 1
  # pretty tab ui
  patch -p1 < ../pretty-tab.patch || return 1
  ./configure --prefix=/usr \
    --with-terminfo=/usr/share/terminfo \
	--enable-256-color \
	--with-term=rxvt-256color || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/terminfo"
  export TERMINFO="${pkgdir}/usr/share/terminfo"
  make DESTDIR="${pkgdir}" install || return 1
  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed || return 1
  install -Dm 755 doc/rxvt-tabbed "${pkgdir}/usr/bin/urxvt-tabbed" || return 1
  # install freedesktop menu and icon ( icon from cvs checkout )
  install -Dm644 ../${_pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 ../${_pkgname}.png \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
