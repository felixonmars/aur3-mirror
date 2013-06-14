pkgname=vba-m-sdl
pkgver=1.8.0.1159
_pkgcode=1159
pkgrel=1
pkgdesc="A VBA fork that focuses on consolidating existing ports and improving VBA in general"
arch=(i686 x86_64)
url="http://vba-m.com/"
license=('GPL2')
depends=('sdl' 'libpng' 'mesa' 'sfml1.6')
provides=('vba-m')
conflicts=('vba-m' 'vba-m-gtk')
makedepends=('cmake' 'yasm')
backup=('etc/vbam.cfg')
source=("http://sourceforge.net/projects/vbam/files/vbam-src/vbam-r$_pkgcode-src.tar.bz2")
md5sums=('e7482def4cd5d7ced65d4f9282161c77')

build() {
  sed -i 's|/usr/include|/usr/include/sfml-1.6|' CMakeScripts/FindSFML.cmake
  sed -i 's|NAMES sfml-${LOWERCOMPONENT}|NAMES sfml-${LOWERCOMPONENT}-1.6|' CMakeScripts/FindSFML.cmake

  CXXFLAGS="$CXXFLAGS -I/usr/include/sfml-1.6" cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDATA_INSTALL_DIR:PATH=share/vbam \
    -DVERSION="$pkgver" -DENABLE_LINK=ON \
    -DENABLE_WX=OFF -DENABLE_GTK=OFF \
    -DENABLE_SDL=ON -DENABLE_ASM_CORE=ON \
    -DENABLE_ASM_SCALERS=ON -DENABLE_FFMPEG=OFF

  make

  sed 's/wxvbam/vbam/' -i "$srcdir"/src/wx/wxvbam.desktop
  sed 's/=vbam/=vba-m-sdl.png/' -i "$srcdir"/src/wx/wxvbam.desktop
}

package() {
  make DESTDIR="$pkgdir" install
  install -Dm644 debian/vbam.1 "$pkgdir"/usr/share/man/man1/vbam.1
  install -Dm644 doc/ReadMe.SDL.txt "$pkgdir"/usr/share/doc/vba-m/README
  install -Dm644 src/wx/wxvbam.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
  install -Dm644 src/gtk/icons/32x32/apps/vbam.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png
}
