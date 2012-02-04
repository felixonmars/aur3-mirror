# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=ecore-svn-arche17
pkgver=latest
pkgrel=1
pkgdesc="An abstraction layer for e17, based on the arche17 project's PKGBUILD"
arch=('i686' 'x86_64')
groups=('e17-libs-svn-arche17' 'e17-svn-arche17')
url="http://www.enlightenment.org"
license=('BSD')
depends=('libxp' 'curl' 'libxss' 'evas-svn' 'libxtst' 'libxcomposite' 
	'libxrandr' 'libxinerama' 'libxcursor' 'eina-svn')
makedepends=('subversion')
conflicts=('ecore' 'ecore-svn')
provides=('ecore' 'ecore-svn')
options=('!libtool' '!emptydirs')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/ecore"
_svnmod="ecore"

build() {
  cd $srcdir

  if [ $NOEXTRACT -eq 0 ]; then
    msg "Connecting to $_svntrunk SVN server...."
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up)
    else
      svn co $_svntrunk --config-dir ./ $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

  fi
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  ./autogen.sh --prefix=/usr --enable-ecore-evas-opengl-x11 --enable-glib \
	--enable-inotify --enable-openssl --disable-gnutls --enable-ecore-con
  make
}

package(){
  cd $srcdir/$_svnmod-build
  make DESTDIR=$pkgdir install
 
# install license files
  install -Dm644 $srcdir/$_svnmod-build/COPYING \
        $pkgdir/usr/share/licenses/$pkgname/COPYING
 
  rm -r $startdir/src/$_svnmod-build

}
