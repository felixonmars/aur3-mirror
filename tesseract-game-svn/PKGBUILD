# Maintainer: portals <portals at riseup.net>
# Contributer: novemberist
# Contributer: PyroDevil
# Contributer: giacomogiorgianni@gmail.com 

pkgname=tesseract-game-svn
pkgrel=1
pkgver=r1826
pkgdesc="A FPS game focused on instagib deathmatch and capture-the-flag gameplay"
url="http://tesseract.gg/"
depends=('libgl' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'libpng' 'mesa' 'zlib')
makedepends=('subversion')
arch=('i686' 'x86_64')
license=('ZLIB')

source=('tesseract::svn://svn.tuxfamily.org/svnroot/tesseract/main' 
	'tesseract_svn' 
	'tesseract_game_svn.desktop' 
	'https://raw.githubusercontent.com/lsalzman/tesseract/master/data/cube.png')

md5sums=('SKIP' 
	 '6407d6a236022ecff0419cb3e001fcf8'
	 'cb8befdc651ce845e3f0116e17b198c6'
	 '1e08b386880b30408465c36bece95e4f')

pkgver() {
  cd "$srcdir/tesseract"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd $srcdir/tesseract/
  make -C src install 
}

package() {

  cd $srcdir/tesseract/
  mkdir -p "${pkgdir}/usr/share/tesseract-svn/"
 
 
  cp -R media/ config/ $pkgdir/usr/share/tesseract-svn

  # Start file
  install -Dm755 $srcdir/tesseract/bin_unix/native_client $pkgdir/usr/bin/client_tesseract_svn
  install -Dm755 $srcdir/tesseract/bin_unix/native_server $pkgdir/usr/bin/server_tesseract_svn
  install -Dm755 $srcdir/tesseract_svn $pkgdir/usr/bin/tesseract_game_svn
  
  install -d "${pkgdir}/usr/share/icons"
  install "$srcdir/cube.png" "${pkgdir}/usr/share/icons/tesseract_game_svn.png"
  install -d "${pkgdir}/usr/share/applications"
  install "$srcdir/tesseract_game_svn.desktop" "${pkgdir}/usr/share/applications/tesseract_game_svn.desktop"


  

}