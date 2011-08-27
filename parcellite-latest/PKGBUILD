# Contributor: dante4d <dante4d@gmail.com>
# Modified: Yuanhao Li
pkgname=parcellite-latest
pkgver=130
pkgrel=1
pkgdesc="Lightweight GTK+ clipboard manager, SVN version"
arch=('i686' 'x86_64')
url="http://code.google.com/p/xyhthyx/"
license=('GPL3')

depends=('gtk2')
makedepends=('svn' 'intltool')
provides=('parcellite')
conflicts=('parcellite' 'parcellite-svn')
replaces=('parcellite' 'parcellite-svn')
install=
source=()
md5sums=()

_svntrunk="https://parcellite.svn.sourceforge.net/svnroot/parcellite/trunk"
_svnmod="parcellite-svn"

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up )
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

#  rm -r $startdir/src/$_svnmod-build 2&> /dev/null
#  cp -r $_svnmod $_svnmod-build
  cd $srcdir/parcellite-svn/

  #
  # BUILD
  #
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg/ install
}
