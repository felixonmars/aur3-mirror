# Maintainer: Taylor Venable <taylor@metasyntax.net>

pkgname=scheme48-hg
pkgver=1607
pkgrel=1
pkgdesc="Scheme 48 is an implementation of Scheme"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('scheme48')

provides=('scheme48')
conflicts=('scheme48')

license=('BSD')
source=('makefile.patch')
md5sums=('49cd57efad9a033be701b957a4a668ae')
url='http://s48.org/'

_hgroot='http://www.s48.org/cgi-bin/hgwebdir.cgi'
_hgrepo='s48'

build() {
  cd "$srcdir"

  rm -rf build
  hg clone "$_hgrepo" build
  cd build

  patch < "${srcdir}/makefile.patch"

  # Taken from the autogen.sh script.  If you just call that script by itself,
  # you can't invoke configure with arguments and you can't install (because it
  # removes the Makefile when it's done).

  ACLOCAL="aclocal -I m4" autoreconf -v -i
  ./configure --prefix=/usr --docdir=/usr/share/doc/scheme48
  rm -rf autom4te.cache
  rm -f scheme48.image build/initial.image-32 build/initial.image-64 c/scheme48.h
  make build/filenames.make
  make i-know-what-i-am-doing
  make c/scheme48.h
  make build/initial.image-32 build/initial.image-64
}

package() {
  cd "${srcdir}/build"

  # This is so wrong. We need to get tex2page from the Racket installation to
  # build the docs. Sigh.

  # rm -rf "${srcdir}/tmp"
  # mkdir -p "${srcdir}/tmp/texmf/tex/latex"
  # mkdir -p "${srcdir}/tmp/texmf/tex/plain"
  # cp /usr/lib/racket/collects/tex2page/tex2page.sty "${srcdir}/tmp/texmf/tex/latex"
  # cp /usr/lib/racket/collects/tex2page/tex2page.tex "${srcdir}/tmp/texmf/tex/plain"
  # mktexlsr "${srcdir}/tmp/texmf"
  # export TEXMFLOCAL="${srcdir}/tmp/texmf"

  make DESTDIR="$pkgdir" install-no-doc
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Generic names not allowed - they would conflict with the generic names used
  # by other packages. Sigh.

  rm "${pkgdir}/usr/bin/scheme-r5rs"
  rm "${pkgdir}/usr/bin/scheme-srfi-7"
}
