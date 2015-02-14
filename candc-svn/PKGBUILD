# Maintainer: jpate <jkpate@jkpate.net>

# To download the source and models, you will need to register for a username and password at:
# http://svn.ask.it.usyd.edu.au/trac/candc/wiki/Register

pkgname=candc-svn
pkgver=r2545
pkgrel=3
pkgdesc="A large-scale semantic parsing system based on Combinatory Categorial Grammar and Discourse Representation Theory"
arch=('x86_64' 'i686')
url="http://svn.ask.it.usyd.edu.au/trac/candc"
license=('custom:candc' 'custom:boxer')
depends=( 'swi-prolog' 'gsoap' )
conflicts=( 'candc' )
provides=( 'candc' )
makedepends=( )
optdepends=( )
options=(!strip)
source=(
  "candc::svn+http://svn.ask.it.usyd.edu.au/candc/trunk"
  "http://svn.ask.it.usyd.edu.au/download/candc/models-1.02.tbz2"
)
md5sums=(
  'SKIP'
  '9dfbdb21dde52359bf2cc1b1403f01d5'
)
pkgver() {
  cd "candc"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}
install="${pkgname}.install"

prepare() {
  cd "${srcdir}/candc"

  ln -sf Makefile.unix Makefile

  # we have gsoap as a dependency, so we don't need to compile and download yet again
  sed -i 's/ ext\// \/usr\//g' Makefile.unix Makefile.targets Makefile.deps
  sed -i 's/Iext\//I\/usr\//g' Makefile.unix Makefile.targets Makefile.deps
  sed -i 's/Lext\//L\/usr\//g' Makefile.unix Makefile.targets Makefile.deps
}

build() {
  cd "${srcdir}/candc"
  make

  make bin/boxer
  make soap
}

package() {
  install -d -m755 "${pkgdir}/usr/bin/"
  install -d -m644 "${pkgdir}/usr/share/candc/models"

  cp "${srcdir}/candc/bin"/* "${pkgdir}/usr/bin/"

  cp -r "${srcdir}/models"/* "${pkgdir}/usr/share/candc/models/"
  chmod -R a+rx "${pkgdir}/usr/share/candc/models/"

  install -D -m644 "${srcdir}/candc/LICENCE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "${srcdir}/candc/LICENCE-BOXER.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-BOXER"
}

