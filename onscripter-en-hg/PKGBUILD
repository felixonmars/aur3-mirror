# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Marcin Skory <armitage at q84fh dot net>

_pkgname=onscripter-en
pkgname=${_pkgname}-hg
pkgver=r558.e8e7e35ed448
pkgrel=1
pkgdesc="English version of the open source interpreter for the visual novel game scripting engine NScripter (Mercurial version)"
arch=('i686' 'x86_64')
url='http://unclemion.com/onscripter/'
license=('GPL')
depends=('gcc-libs' 'sdl_mixer' 'sdl_image' 'sdl_ttf' 'bzip2' 'smpeg' 'freetype2')
makedepends=('mercurial')
provides=('onscripter-en')
conflicts=('onscripter-en' 'onscripter-en-svn')
source=("hg+http://unclemion.com/hg/onscripter-en/")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$_pkgname"

  install -D -m755 "$srcdir/$_pkgname/onscripter-en" "$pkgdir/usr/bin/onscripter-en"
  install -dm755 "$pkgdir/usr/share/doc/onscripter-en"
  install -m644 BUGS CHANGES INSTALL README "$pkgdir/usr/share/doc/onscripter-en"
}

# vim:set ts=2 sw=2 et:
