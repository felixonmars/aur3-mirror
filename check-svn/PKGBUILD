# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=check-svn
pkgver=618
pkgrel=2
pkgdesc="A unit testing framework for C - svn version"
arch=('i686' 'x86_64')
url="http://check.sourceforge.net/"
license=('LGPL')
depends=()
makedepends=('subversion')
provides=('check')
conflicts=('check')
options=('!libtool')
install=$pkgname.install
source=()
md5sums=()

_svntrunk=https://check.svn.sourceforge.net/svnroot/check
_svnmod=check

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  [ -d $srcdir/${_svnmod}-build ] && rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  sed -i "99iAM_PROG_AR" configure.ac
  autoreconf --install

  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir/" install
}
