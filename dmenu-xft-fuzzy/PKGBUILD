pkgname=dmenu-xft-fuzzy
pkgver=4.5
pkgrel=5
pkgdesc="dmenu with xft and fuzzy matching patches."
arch=('i686' 'x86_64')
url="http://tools.suckless.org/dmenu/"
license=('MIT')
depends=('freetype2' 'libxinerama' 'libxft' 'libxrender' 'zlib' 'fontconfig')
optdepends=()
makedepends=()
provides=('dmenu')
conflicts=('dmenu')
source=(
    'config.mk'
    'dmenu.1'
    'dmenu.c'
    'dmenu_run'
    'draw.c'
    'draw.h'
    'LICENSE'
    'Makefile'
    'README'
    'stest.1'
    'stest.c'
)
md5sums=('901cffc409f4c927ba6ee411e0c65cc4'
         '172c6f1d21dcfa6b1da7dde2037d35a6'
         '5136a7cc4aa61f0010b7b80f391a9cf0'
         'e3fa1ea69c08900441ac9d0faa22ddfa'
         '0664e5ad1912642cf324515ca96438be'
         '7081b0ca8f7df5d00087f8ab5efef848'
         'd8b6ddeab2664b81df47bc8817323d7e'
         '9a0d73cec519fa22578319c33f98aed2'
         'a49ed0d8c00a57583d12a7e4b65221fa'
         'd9bb193ab3466b85744f3d6e3f0ae522'
         '2f21975ba006c722873d7c1a1c71e742')

build() {
  make
}

package() {
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
