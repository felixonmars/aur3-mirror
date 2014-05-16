pkgname=tesseract-game-bin
pkgver=20140511
pkgrel=1
pkgdesc="A FPS game focused on instagib deathmatch and capture-the-flag gameplay"
url="http://tesseract.gg/"
depends=('libgl' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'libpng' 'mesa' 'zlib')
makedepends=('subversion')
arch=('i686' 'x86_64')
license=('ZLIB')
       #"http://download.tuxfamily.org/tesseract/tesseract_2014_05_12_first_edition_linux.tar.xz"
source=("http://download.tuxfamily.org/tesseract/tesseract_2014_05_12_first_edition_linux.tar.xz"
        "tesseract_unix"
        "tesseract-game.desktop"
        "https://raw.githubusercontent.com/lsalzman/tesseract/master/data/cube.png")

#build() {
#  cd $srcdir/
#}

package() {
  cd "$srcdir/tesseract"

  install -d "${pkgdir}/usr/share/icons"
  install "$srcdir/cube.png" "${pkgdir}/usr/share/icons/tesseract-game.png"
  install -d "${pkgdir}/usr/share/applications"
  install "$srcdir/tesseract-game.desktop" "${pkgdir}/usr/share/applications/tesseract-game.desktop"

  install -d "${pkgdir}/usr/share/tesseract/"
  cp -R media/ config/ $pkgdir/usr/share/tesseract

  [ "$CARCH" = "x86_64" ] && install -Dm755 $srcdir/tesseract/bin_unix/linux_64_client $pkgdir/usr/bin/client-tesseract
  [ "$CARCH" = "x86_64" ] && install -Dm755 $srcdir/tesseract/bin_unix/linux_64_server $pkgdir/usr/bin/server-tesseract

  [ "$CARCH" = "i686" ] && install -Dm755 $srcdir/tesseract/bin_unix/linux_client $pkgdir/usr/bin/client-tesseract
  [ "$CARCH" = "i686" ] && install -Dm755 $srcdir/tesseract/bin_unix/linux_server $pkgdir/usr/bin/server-tesseract

  install -Dm755 $srcdir/tesseract_unix $pkgdir/usr/bin/tesseract-game
}

md5sums=('9d68c50615213ca7e84899860be4782b'
         'e70f6dd49bcc235a29cef5935ccc3715'
         'a451e19edb42497d536f170c0a2a48e2'
         '1e08b386880b30408465c36bece95e4f')
