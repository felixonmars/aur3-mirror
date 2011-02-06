# Contributor: Tarinaky <tarinaky@gmail.com>
pkgname=crimesquad-svn
pkgver=418
pkgrel=1
pkgdesc="A satirical console-based political role-playing/strategy game in which you recruit a team of Elite Liberal radicals and try to save the United States from a descent into Arch-Conservatism. Gameplay based loosely on the classic 1983 RPG Oubliette."
arch=(i686)
url="http://sourceforge.net/projects/lcsgame/"
license=('GPL')
groups=()
depends=()
makedepends=('subversion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://lcsgame.svn.sourceforge.net/svnroot/lcsgame/trunk/
_svnmod=trunk

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
  #./autogen.sh
  ./bootstrap
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
