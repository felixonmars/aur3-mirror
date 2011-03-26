# Contributor: FrozenFox <frozenfoxz@gmail.com>

pkgname=tremfusion-hg
pkgver=20091030
pkgrel=2
pkgdesc="Community updated Tremulous client (devel)"
arch=('i686' 'x86_64')
url="http://www.tremfusion.net/"
license=('GPL')
depends=('tremulous' 'curl' 'directfb' 'freetype2' 'libogg' 'ncurses' 'sdl')
makedepends=('mercurial')
optdepends=("openal: OpenAL audio support")
conflicts=('tremfusion')
provides=('tremfusion')
options=(!emptydirs)
install=tremfusion.install
conflicts=('tremfusion')
source=('http://www.tremfusion.net/downloads/z-tremfusion-menu-0.99r3.pk3'
        'tremfusion.desktop'
        'tremfusion.png')
md5sums=('e04e75d705351d3450923a6dc1fd0cd8'
         'f49d5326d4fdfde01730dbdf0338e360'
         '1dd34741fd50422f8103da142afddcc7')
_hgroot="http://www.tremfusion.net/hg/tremfusion/default"

build() {
  # Download the source
  msg "Connecting to mercurial server..."
  hg clone $_hgroot
  cd default

  # Compile and install the game binaries
  make || return 1
  make DESTDIR=${pkgdir} \
       BUILDROOT=${pkgdir} \
       INSTALL_PREFIX="/opt/tremulous" \
       BINDIR="/usr/bin" \
       DATADIR="/opt" \
       LIBDIR="/opt/tremulous" install || return 1

  # Install the game data
  install ${srcdir}/*.pk3 ${pkgdir}/opt/tremulous/tremfusion || return 1
  install ${srcdir}/default/build/release*/base/ui*.so \
          ${pkgdir}/opt/tremulous/tremfusion || return 1

  # Install the icon and start menu entry
  install -m0644 -D ${srcdir}/tremfusion.png \
                    ${pkgdir}/usr/share/pixmaps/tremfusion.png || return 1
  install -m0644 -D ${srcdir}/tremfusion.desktop \
                    ${pkgdir}/usr/share/applications/tremfusion.desktop || return 1
}

