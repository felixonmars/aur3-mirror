# This PKGBUILD is adapted from the PKGBUILD found in the ABS
# Edit your .lircrc file to send commands to program 'zsnes'.
# See readme.lirc for details.

# Maintainer: Mr Hutts <hutts at internode dot on dot net>

pkgname=zsnes-lirc
pkgver=1.51
pkgrel=2
pkgdesc="Super Nintendo emulator with LIRC suport"
url="http://www.zsnes.com/"
arch=('i686')
license=('GPL')
options=(!buildflags)
provides=('zsnes')
conflicts=('zsnes')
replaces=()
install="${pkgname}.install"
depends=('gcc-libs' 'sdl' 'libpng>=1.5.0' 'libgl' 'ncurses' 'lirc-utils')
optdepends=('alsa-lib: sound support')
makedepends=('nasm' 'gcc' 'gendesk' 'mesa')

source=(http://downloads.sourceforge.net/zsnes/zsnes151src.tar.bz2
        zsnes.patch
        zsnes-1.51-libpng15.patch
        zsnes.png
	zsnes_lirc.patch
	zsnes_autogen.patch
	readme.lirc)
noextract=('zsnes.patch' 'zsnes-1.51-libpng15.patch' 'zsnes.png' 'zsnes_lirc.patch' 'zsnes_autogen.patch' 'readme.lirc')
md5sums=('7071186bf80632ae88a153239498d8c9'
         'fd13769c13de49601a234b46fb802a75'
         'ea82b4dbf31c87dbcc6c67d02ddfb299'
         'b5260c02adfc3b7ff725041214b00bfd'
	 '72aa2fb25abfe8d8199001d17c4be403'
	 'f22a07dffd4e4ccd55fab0cee929a56a'
	 '091bcb03b54449255628fc893b73d3c6')

prepare() {
  cd "$srcdir/zsnes_1_51"

  patch -p1 -i ../zsnes.patch
  patch -p0 -i ../zsnes-1.51-libpng15.patch
  patch -t -p1 -i ../zsnes_lirc.patch
  patch -p1 -i ../zsnes_autogen.patch
}

build() {
  cd "$srcdir/zsnes_1_51/src"

  if [ $CARCH == "x86_64" ]; then
    export CC="gcc -m32"
    export CXX="g++ -m32"
  fi

  ./autogen.sh \
    --prefix=/usr \
    --enable-release \
    --enable-lirc \
    x_libraries=/usr/lib \
    force_arch=i686

  make
}

package() {
  cd "$srcdir"

  gendesk

  cd "zsnes_1_51/src"

  make DESTDIR=${pkgdir} install

  # adding --mandir= to autoconf line fails
  install -dm755 ${pkgdir}/usr/share

  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/zsnes.desktop
  install -Dm644 ${srcdir}/zsnes.png ${pkgdir}/usr/share/pixmaps/zsnes.png

  mv ${pkgdir}/usr/man ${pkgdir}/usr/share
}

# vim:set ts=2 sw=2 et:
