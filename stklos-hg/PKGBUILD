# Contributor: Taylor Venable <taylor@metasyntax.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='stklos-hg'
pkgver=454.58d3b87ebc49
pkgrel=1
pkgdesc='A free Scheme system compliant with the languages features defined in R5RS'
arch=('i686' 'x86_64')
url='http://www.stklos.net/index.html'
license=('GPL')
depends=('gc' 'gmp' 'libffi' 'pcre')
makedepends=('mercurial')
conflicts=('stklos')
provides=('stklos')
options=('!makeflags')
source=(STklos::hg+http://www.stklos.net/download/current-tree/)
md5sums=('SKIP')
_hgname='STklos'

pkgver() {
  cd $srcdir/${_hgname}
  echo $(hg identify -n).$(hg identify -i)|sed 's:+::g'
}

build() {
  cd "$srcdir/${_hgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_hgname}"
  make DESTDIR="$pkgdir" install
}
