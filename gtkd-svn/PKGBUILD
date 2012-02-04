# author: MrSunshine
pkgname=gtkd-svn
pkgver=898
pkgrel=1
pkgdesc="D binding and OO wrapper of GTK+. This version is compiled for D2."
arch=('i686' 'x86_64')
url="http://www.dsource.org/projects/gtkd"
license=('LGPL')
depends=('gtk2' 'gtkglext')
makedepends=('d2_config-hg' 'subversion')
provides=('gtkd')
conflicts=('gtkd')
#source=(http://www.ratedo.com/files/gtkD-1.2.zip)
#install=(${pkgname}.install)
md5sums=('')

_svntrunk=http://svn.dsource.org/projects/gtkd/trunk
_svnmod=gtkd

build() {
   cd ${srcdir}

   if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up)
   else
      svn co $_svntrunk --config-dir ./ $_svnmod
   fi

   msg "SVN checkout done or server timeout"
   msg "Starting make..."

   cd $_svnmod/

	#dsss build || exit 1;
   make libs || exit 1;

	#dsss install --prefix=$startdir/pkg/usr || exit 1;
   make install prefix=$startdir/pkg/usr || exit 1;

	#chmod +r ${startdir}/pkg/usr/share/dsss/manifest/gtkd.manifest
}
