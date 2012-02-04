# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=efreet-svn-arche17
pkgver=latest
pkgrel=1
pkgdesc="freedesktop.org specifications for e17, based on the arche17 project's PKGBUILD"
arch=('i686' 'x86_64')
groups=('e17-libs-svn-arche17' 'e17-svn-arche17')
url="http://www.enlightenment.org"
license=('BSD')
depends=('ecore-svn')
makedepends=('subversion')
conflicts=('efreet' 'efreet-svn')
provides=('efreet' 'efreet-svn')
options=('!libtool')
source=()
sha1sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/efreet"
_svnmod="efreet"

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

  ./autogen.sh --prefix=/usr --enable-icon-cache
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


