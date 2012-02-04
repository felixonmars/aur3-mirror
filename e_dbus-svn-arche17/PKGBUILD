# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=e_dbus-svn-arche17
pkgver=latest
pkgrel=1
pkgdesc="dbus abstraction layer for e17, based on the arche17 project's PKGBUILD"
arch=('i686' 'x86_64')
groups=('e17-libs-svn-arche17' 'e17-svn-arche17')
url="http://www.enlightenment.org"
license=('BSD')
depends=('ecore-svn' 'dbus-core' )
makedepends=('subversion')
conflicts=('e_dbus' 'e_dbus-svn')
provides=('e_dbus' 'e_dbus-svn')
replaces=('e_dbus-cvs')
options=('!libtool')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/e_dbus"
_svnmod="e_dbus"

build() {
   cd $srcdir

  msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make
}

package(){
  cd $srcdir/$_svnmod-build

  make DESTDIR=$pkgdir install

# install license files
  install -Dm644 $srcdir/$_svnmod-build/COPYING \
        $pkgdir/usr/share/licenses/$pkgname/COPYING

  rm -r $srcdir/$_svnmod-build

}
