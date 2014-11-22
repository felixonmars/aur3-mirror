# Maintainer: James Morris <james@jwm-art.net>
pkgname=subtitleripper
pkgver=0.3_4
pkgrel=2
pkgdesc="DVD subtitle to text converter"
arch=('x86_64' 'i686')
url="http://subtitleripper.sourceforge.net/"
license=('GPL')
#groups=()
depends=('netpbm')
makedepends=('make' 'gcc')
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver//_/-}/${pkgname}-${pkgver//_/-}.tgz")
#noextract=()
md5sums=('c0bd49a88f667c68c4430ad25bbed510')

prepare() {
  cd "$pkgname"
  # use netpbm instead of libppm or whatever it was
  sed -i 's/_HAVE_LIB_PPM_/_HAVE_NETPBM_/g' *
  sed -i 's|<ppm.h>|<netpbm/ppm.h>|g' *.[ch]
  sed -i 's/-lppm/-lnetpbm/' Makefile
  # quieten warnings about exit():
  sed -i '1s/^/#include <stdlib.h>/' subtitle2pgm.c
  # force use of getline to prevent aborted build:
  sed -i 's/DEFINES :=/DEFINES := -DHAVE_GETLINE/' Makefile
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  mkdir -p "${pkgdir}/usr/bin"
  chmod +rx pgm2txt srttool subtitle2pgm subtitle2vobsub vobsub2pgm
  cp pgm2txt srttool subtitle2pgm subtitle2vobsub vobsub2pgm "${pkgdir}/usr/bin"
}
