# Contributor: Popov Yaroslav <domicher@mail.ru>
pkgname=climm-svn
pkgver=2591
pkgrel=2
pkgdesc="SVN-version of free text-based instant messaging client with xmpp support"
arch=('i686' 'x86_64')
url="http://www.climm.org"
license=('GPL')
depends=('tcl' 'gloox')
makedepends=('autoconf' 'automake')
provides=('climm')
conflicts=('climm')
source=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=http://svn.climm.org/climm/
_svnmod=climm

build() {
  cd "$startdir/src"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  ./prepare
  ./configure --enable-xmpp --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
