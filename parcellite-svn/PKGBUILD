# Maintainer: dante4d <dante4d@gmail.com>
pkgname=parcellite-svn
pkgver=20110517
pkgrel=1
pkgdesc="A lightweight GTK+ clipboard manager, SVN version"
arch=('i686' 'x86_64')
url="http://parcellite.sourceforge.net/"
license=('GPL3')
depends=('gtk2>=2.10' 'glib2>=2.14')
makedepends=('svn')
provides=('parcellite')
conflicts=('parcellite')

_svntrunk="https://parcellite.svn.sourceforge.net/svnroot/parcellite/trunk"
_svnmod="parcellite"

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up )
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
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
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg/ install
}
