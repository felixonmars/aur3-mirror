# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=macaon-svn
pkgver=38
pkgrel=2
pkgdesc="A natural language processing (NLP) toolchain that can work on ambiguous inputs (word lattices)."
arch=(i686 x86_64)
url="http://macaon.lif.univ-mrs.fr/"
license=('GPL')
groups=()
depends=('glib2' 'libxml2' 'gfsm')
makedepends=('subversion' 'pkg-config')
provides=(macaon)
conflicts=(macaon)
debconflicts=(macaon)
debdepends=(gfsm libglib2.0-0 libxml2)
debprovides=(macaon)
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://svn.lif.univ-mrs.fr/macaon/trunk
_svnmod=macaon

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
