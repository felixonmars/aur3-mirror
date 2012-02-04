# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=eina-svn-arche17
pkgver=latest
pkgrel=1
pkgdesc="E17 file chunk reading/writing library, based on the arche17 project's PKGBUILD"
arch=('i686' 'x86_64')
groups=('e17-libs-svn-arche17' 'e17-svn-arche17')
url="http://www.enlightenment.org"
license=('LGPL2')
depends=('glibc')
makedepends=('subversion')
conflicts=('eina' 'eina-svn')
provides=('eina' 'eina-svn')
options=('!libtool' '!emptydirs')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/eina"
_svnmod="eina"

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

  ./autogen.sh --prefix=/usr --enable-amalgamation
  make
}

package(){
  cd $srcdir/$_svnmod-build
  make DESTDIR=$pkgdir install

  rm -r $srcdir/$_svnmod-build

}
