# PKGBUILD for EQC: Latex Equation Compiler
# Maintainer: Cristóbal Tapia <crtapia a gmail com>

pkgname=eqc
pkgrel=1
pkgver=1.4.12
pkgr=96
pkgdesc="A preprocessor for LaTeX files that enables numeric and symbolic calculations"
arch=('x86_64' 'i686')
url="http://eqc.sourceforge.net/wiki/index.php/Main_Page"
license="(L)GPL"
depends=('subversion' 'ginac' 'cln' 'gmp' 'flex' 'bison' 'texlive-science' 'texlive-pstricks' 'linuxdoc-tools'
        'docbook2x' 'dblatex' 'doxygen' 'texlive-fontsextra' 'ghostscript')
source=(svn+svn://svn.code.sf.net/p/eqc/code#revision=$pkgr)
md5sums=('SKIP')
install='eqc.install'

build() {

  cd "$srcdir"/code

  autoreconf -i
  ./configure

  make

}

package() {

  cd "$srcdir"/code
  make DESTDIR="$pkgdir" install

}
