# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=virtuoso-cvs
pkgver=20101214
pkgrel=1
pkgdesc="Virtuoso is a high-performance object-relational SQL database"
arch=('i686' 'x86_64')
url="http://www.openlinksw.com/dataspace/dav/wiki/Main/"
license=('GPL')
#depends=('imagemagick' 'libldap' 'flex' 'bison' 'gperf' 'gawk' 'openssl')
#makedepends=('cvs' 'autoconf' 'libtool')
depend=()
makedepend=()
provides=('virtuoso=6.1.2' 'virtuoso-opensource=6.1.2')
conflicts=('virtuoso' 'virtuoso-opensource' 'unixodbc')
options=(!makeflags)
source=()

_cvsroot=":pserver:anonymous@virtuoso.cvs.sourceforge.net:/cvsroot/virtuoso"
_cvsmod="virtuoso-opensource"

build() {
   cd ${srcdir}
   msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
   if [ -d $_cvsmod/CVS ]; then
      cd $_cvsmod
      cvs -z3 update -d
   else
      cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
#      cvs -z3 -d $_cvsroot co -f $_cvsmod
      cd $_cvsmod
   fi

   ./autogen.sh
   msg "CVS checkout done or server timeout"
   msg "Starting make..."
   cp -r ../$_cvsmod ../$_cvsmod-build
   cd ../$_cvsmod-build

   cd "$srcdir/$_cvsmod"
   ./configure --prefix=/usr

   make  || return 1
   make DESTDIR="$pkgdir/" install || return 1

#   rm -r ${srcdir}/$_cvsmod-build
}
