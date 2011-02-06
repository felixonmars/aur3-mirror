# Contributor: Markus Gross (xsdnyd [at] gmail.com)

pkgname=hets-lib-svn
pkgver=812
pkgrel=1
pkgdesc="Library files for Hets."
url="http://www.informatik.uni-bremen.de/agbkb/forschung/formal_methods/CoFI/hets/index_e.htm"
arch=(i686)
license=CUSTOM
depends=()
makedepends=('subversion')
provides=('hets-lib')
source=(hets-lib.sh)
md5sums=(f044678c14210fa59ade74f5adc8a511)

_svntrunk=https://svn-agbkb.informatik.uni-bremen.de/Hets-lib/trunk
_svnmod=hets-lib

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]
  then
      (cd $_svnmod && svn up -r $pkgver)
  else
      svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  cd $_svnmod

  mkdir -p $startdir/pkg/usr/lib/hets
  cp -r * $startdir/pkg/usr/lib/hets

   #install sh file to register HETS_LIB variable
  mkdir -p $startdir/pkg/etc/profile.d/
  cp $startdir/hets-lib.sh $startdir/pkg/etc/profile.d/
}
# vim:syntax=sh
