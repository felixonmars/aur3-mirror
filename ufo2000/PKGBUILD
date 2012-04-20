# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Eduard Sukharev <kraplax AT mail DOT ru>
# Contributor: Wesley

pkgname=ufo2000
pkgver=0.9.1176
pkgrel=1
pkgdesc="An open source turn-based tactical squad simulation multiplayer game"
arch=('i686' 'x86_64')
url="http://ufo2000.sourceforge.net/"
license=('GPL')
depends=('allegro4' 'expat' 'freetype2' 'gcc-libs' 'hawknl' 'libpng' 'lua' 'sqlite3')
optdepends=('ruby: additional scripts')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.bz2"
        "${pkgname}.sh"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('158b507a8f21432c84f57aaac0caa39e'
         'ed379fb1c3d9ba61d7591186e6c056d3'
         'c39fa2f286591497a25e11811ddf8585'
         '8afe462aee326c008223831b838e68e1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
#  sed -i "s/CFLAGS =/CFLAGS +=/" makefile
#  sed -i "s/O_BINARY/0/" src/{font,main,map,pck,skin,terrapck}.cpp
  make || return 1
  make server || return 1
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  install -dm777 "${pkgdir}/opt/${pkgname}"
  cp -rf arts datfile extensions fonts init-scripts newmusic \
    newunits script TFTD translations XCOM "${pkgdir}/opt/${pkgname}"
  install -m644 *.{dat,ini,lua,xml} "${pkgdir}/opt/${pkgname}"
  install -m666 *.conf "${pkgdir}/opt/${pkgname}"

  # Install binary files
  install -m755 "${pkgname}"{,-srv} "${pkgdir}/opt/${pkgname}/"

  # Install docs
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -rf docs "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS ChangeLog HACKING INSTALL readme*.{txt,html} \
    "${pkgdir}/usr/share/doc/${pkgname}"

  # Install launcher, icon and .desktop file
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
