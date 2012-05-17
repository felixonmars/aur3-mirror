# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: roberto <roberto@archlinux.org>

pkgname=xconq
pkgver=7.5.0pre20050612
pkgrel=2
pkgdesc="An open source engine for turn-based strategy games"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xconq/"
license=('GPL')
depends=('gcc-libs' 'libxaw' 'sdl' 'tk')
makedepends=('perl')
install="${pkgname}.install"
source=("${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('08c84547bb5f5ecbac6799a680d7f6e5'
         'cc8110ecfd4900d2cc00803cd3160c61')

build() {
  cd "${srcdir}"

  _cvstar="http://xconq.cvs.sourceforge.net/viewvc/xconq/xconq/?view=tar"

  # Download source code from CVS (it always has a different md5 sum)
  if [[ ! -f ${pkgname}.tar.gz ]]; then
    curl ${_cvstar} -o ${pkgname}.tar.gz
  fi

  rm -rf ${pkgname}
  bsdtar -xf ${pkgname}.tar.gz
  cd ${pkgname}

  # Configure
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --enable-alternate-gameuser=root \
    --enable-alternate-gamegroup=root \
    --enable-alternate-x11-app-defaults-dir=/usr/share/X11/app-defaults \
    CXXFLAGS=-Wno-write-strings

  # Replace space characters on tabs in Makefiles
  sed -i "s_\s\{8\}_\t_" */Makefile

  # Compile Xconq with Tcl/Tk, SDL and curses interfaces
  make
  make all-sdlconq
  make all-cconq
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install game files
  install -d -m775 -g games "${pkgdir}/var/lib/${pkgname}"
  make prefix="${pkgdir}/usr" \
       infodir="${pkgdir}/usr/share/info" \
       mandir="${pkgdir}/usr/share/man" \
       scoresdir="${pkgdir}/var/lib" \
       install install-sdlconq install-cconq

  # Fix some issues
  chmod 755 "${pkgdir}/usr/bin/"{c,x,sdl}conq
  rmdir "${pkgdir}/usr/share/info"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  cd doc
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  perl texi2html -split_section xconq.texi
  install -m644 xconq*.html "${pkgdir}/usr/share/doc/${pkgname}"
}
