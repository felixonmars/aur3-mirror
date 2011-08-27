# Contributor: fogobogo <fogobogo _at_ archlinux.us>
# better try IRC ;)
pkgname=didiwiki-svn
pkgver=3
pkgrel=2
pkgdesc="a small, simple, self-contained 'personal' wiki engine"
arch=('i686' 'x86_64')
url="http://c2.com/cgi-bin/wiki?DidiWiki"
license=('GPL')
depends=('glibc')
makedepends=('subversion')
md5sums=() #generate with 'makepkg -g'

_svntrunk="http://svn.o-hand.com/repos/didiwiki/trunk"
_svnmod="didiwiki"

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
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
