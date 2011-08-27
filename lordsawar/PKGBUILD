# Maintainer: Dmitrij D. Czarkoff <czarkoff@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail.com>
# Contributor: Christoph Zeiler <rabyte@gmx.dot.org>
# Contributor: Adrián Chaves Fernández aka Gallaecio <adriyetichaves@gmail.com>

pkgname=lordsawar
pkgver=0.2.0
pkgrel=8
pkgdesc="A free, turn-based strategy game in spirit of Warlords II"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/lordsawar/"
license=('GPL3')
depends=('gtkmm' 'sdl_mixer')
makedepends=('pkgconfig' 'gettext' 'intltool' 'libtar' 'boost')
conflicts=('lordsawar-svn')
changelog="ChangeLog"
install="lordsawar.install"
source=("http://download.savannah.gnu.org/releases-noredirect/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	"lordsawar-editor.desktop"
	"lordsawar-editor-32.png"
	"lordsawar-editor-64.png")
md5sums=('06772b3fe86fd5af6d54fd6474b77487'
         '0927bb356c8c184cad13761012f6ad92'
         '063de7530fe208f22037371f5a103b86'
         '8c4baee495aa55e5e250dd735ff0b8ba')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

# You may want to append to "./configure":
# don't compile editor
#    --disable-editor \
# don't compile play-by-mail
#    --disable-pbm \
# don't compile game list server
#    --disable-gls \
# don't compile game host server
#    --disable-ghs \
# zip save files (experimental)
#    --enable-zipping \
  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-sdltest || return 1
  make || return 1
}

package() {
  install -m 644 -D "${srcdir}/lordsawar-editor.desktop" "${pkgdir}/usr/share/applications/lordsawar-editor.desktop"
  install -m 644 -D "${srcdir}/lordsawar-editor-32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/lordsawar-editor.png"
  install -m 644 -D "${srcdir}/lordsawar-editor-64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/lordsawar-editor.png"
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install || return 1
  rm -r ${pkgdir}/usr/share/gnome
}
