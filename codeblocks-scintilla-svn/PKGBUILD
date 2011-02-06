pkgname=codeblocks-scintilla-svn
pkgver=5913
pkgrel=1
pkgdesc="An open source and cross-platform C/C++ IDE. Fixes big settings dialogs."
arch=('i686' 'x86_64')
url="http://www.codeblocks.org"
license=('GPL3')
groups=()
depends=('wxgtk' 'valgrind')
makedepends=('subversion' 'zip')
optdepends=()
provides=('codeblocks' 'codeblocks-svn' 'codeblocks-svn-noplugins')
conflicts=('codeblocks' 'codeblocks-svn' 'codeblocks-svn-noplugins')
backup=()
options=()
install=
source=()
md5sums=()
noextract=()

_svntrunk="svn://svn.berlios.de/codeblocks/branches/scintilla/"
_svnmod=codeblocks-svn

build() {
  cd $startdir/src || return 1

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co -r $pkgver $_svntrunk $_svnmod
  fi

  cd $_svnmod
  ./bootstrap || return 1
  ./configure --prefix=/usr --with-contrib-plugins=all || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

