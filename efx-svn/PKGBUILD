# Maintainer: kuri <sysegv@gmail.com>

pkgname=efx-svn
pkgver=81619
pkgrel=1
pkgdesc="Efx is the effects library on top of evas (EFL)."
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('eina' 'eet' 'evas' 'ecore')
provides=('efx' 'efx-svn')
makedepends=('subversion')
optdepends=()
options=('!libtool')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/efx"
_svnmod="efx"

build()
{
  cd $srcdir

  if [ $NOEXTRACT -eq 0 ]; then
    msg "Connecting to $_svntrunk SVN server...."
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

  fi
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr --disable-tests
  make || return 1
}

package()
{
   cd $_svnmod-build
   make DESTDIR=$pkgdir install || return 1
   rm -r $startdir/src/$_svnmod-build
}
