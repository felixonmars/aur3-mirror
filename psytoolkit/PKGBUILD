# Maintainer: Gijsbert Stoet <gijsbert.stoet@glasgow.ac.uk>
pkgname=psytoolkit
pkgver=2.0.1
pkgrel=1
pkgdesc="PsyToolkit is a scientific toolkit for experimental psychologists"
url="http://www.psytoolkit.org"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('libusb' 'sdl' 'sdl_mixer' 'sdl_ttf' 'sdl_gfx' 'sdl_image' \
         'indent' 'make' 'gcc' 'ruby' 'ruby-gtk2' \
	 'imagemagick' 'libparapin' 'closure-compiler' 'perl' 'ttf-ms-fonts')
optdepends=('R')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://www.psytoolkit.org/download/source/${pkgname}.src.${pkgver}.tar.gz")
md5sums=('c39e039a00177043b58a941147206955')

build() {
  cd "${srcdir}/psytoolkit_src"
  ./install.sh -a -q -b $pkgdir
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
 
package() {
  cd "${srcdir}/psytoolkit_src/files/psylib"
  make || return 1
  make DESTDIR="$pkgdir" install
}
