# Maintainer: Laércio de Sousa <lbsousajr AT gmail DOT com>
_pkgbase=gregorio
pkgbase=$_pkgbase-svn
# Small hack to make AUR accept split packages
pkgname=$pkgbase
true && pkgname=("gregorio-svn" "gregoriotex-svn")
pkgver=1260    
pkgrel=1
pkgdesc="Command-line tool to typeset Gregorian chant"
url=http://home.gna.org/gregorio
arch=("i686" "x86_64")
license=("GPL")
depends=("libltdl")
makedepends=("subversion" "python2" "fontforge" "libxml2" "docbook2x" "libxslt" "glib2" "docbook-xsl")
conflicts=("$_pkgbase")
provides=("$_pkgbase")
source=("$pkgbase::svn://svn.gna.org/svn/$_pkgbase/trunk")
sha256sums=("SKIP")

pkgver() {
  cd $srcdir/$pkgbase
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $srcdir/$pkgbase/fonts
  mv Makefile Makefile.old
  grep -v texhash Makefile.old | sed -e 's@python@python2@g' > Makefile
}

build() {
  cd $srcdir/$pkgbase
  msg "Starting make..."
  msg "Autoreconf'ing sources..."
  autoreconf -f -i
  msg "Configuring..."
  ./configure --prefix=/usr --enable-glib-utf8 || return 1
  msg "Compiling..."
  make || return 1
}

package_gregorio-svn() {
  cd $srcdir/$pkgbase
  msg "Installing binaries, headers and libraries..."
  make DESTDIR=$pkgdir install
}

package_gregoriotex-svn() {
  pkgdesc="LuaTeX style and fonts for Gregorian chant scores"
  depends=("texlive-fontsextra" "texlive-bin" "texlive-formatsextra")
  install=gregoriotex.install
  conflicts=("gregoriotex")
  provides=("gregoriotex")

  msg "Installing GregorioTeX fonts and TeX files..."
  cd $srcdir/$pkgbase/fonts
  make TEXMFROOT=$pkgdir/usr/share/texmf-dist install
}
