# Contributor: lpb612@gmail.com
pkgname=kicadocaml-svn
pkgver=105
pkgrel=1
pkgdesc="a PCB layout editor written in Ocaml for Kicad "
arch=('i686' 'x86_64')
url="http://code.google.com/p/kicadocaml/"
license=('GNU GPL v3')
groups=()
depends=('ocaml' 'ocaml-findlib' 'ocaml-pcre' 'ocaml-lablgl')
makedepends=('subversion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=

noextract=()

_svntrunk=http://kicadocaml.googlecode.com/svn/trunk/
_svnmod=kicadocaml

build() {
cd "$srcdir"

if [ -d $_svnmod/.svn ]; then
(cd $_svnmod && svn up -r $pkgver)
else
svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
fi

msg "SVN checkout done or server timeout"
msg "Starting make..."

rm -rf "$srcdir/$_svnmod-build"
cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
cd "$srcdir/$_svnmod-build"

#
# BUILD
#

sed -i -e 's/lablGL/lablgl/g' \
  -e "s#/usr/local/#$pkgdir/usr/#g" Makefile
sed -i -e '/Pcre.extract/s#\\d#[0-9]#' netlist.ml
make opt
mkdir -p $pkgdir/usr/bin
make install
}

# vim:set ts=2 sw=2 et:
