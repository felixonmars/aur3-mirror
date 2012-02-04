# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=eet-svn-arche17
pkgver=latest
pkgrel=1
pkgdesc="A data storage and compression library, based on the arche17 project's PKGBUILD"
arch=('i686' 'x86_64')
groups=('e17-libs-svn-arche17' 'e17-svn-arche17')
url="http://www.enlightenment.org"
license=('BSD')
depends=('libjpeg>=7' 'openssl' 'eina-svn')
makedepends=('subversion')
conflicts=('eet' 'eet-svn')
provides=('eet' 'eet-svn')
replaces=('eet-cvs')
options=(!libtool)
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/eet"
_svnmod="eet"

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

  ./autogen.sh --prefix=/usr --enable-openssl --disable-gnutls \
	--enable-amalgamation
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

