# PKGBUILD template to install hpctoolkit
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>
pkgname=hpctoolkit-svn
pkgver=r4510
pkgrel=1
pkgdesc="HPCToolkit is an integrated suite of tools for measurement and analysis of program performance on computers ranging from multicore desktop systems to the nation's largest supercomputers."
depends=('python2' 'perl' 'papi')
makedepends=('svn')
conflicts=('hpctoolkit')
privides=('hpctoolkit')
arch=('i686' 'x86_64')
license=('BSD')
url="http://hpctoolkit.org"
source=('svn+http://hpctoolkit.googlecode.com/svn/externals/'
        'svn+http://hpctoolkit.googlecode.com/svn/trunk/')
sha1sums=('SKIP' 'SKIP')
install=

pkgver() {
  cd "$srcdir/trunk"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
  #svnversion | tr -d [A-z]
}

build() {
  #Compiling hpctoolkit-externals-svn
  cd "$srcdir/externals"
  mkdir BUILD && cd BUILD
  export CPPFLAGS=""
  ../configure --without-old-monitor
  make all
  
  #Cofiguring hpctoolkit-svn
  cd "$srcdir/trunk"
  mkdir BUILD && cd BUILD
  ../configure --with-externals="$srcdir/externals/BUILD/" --prefix="/usr/" -with-papi=/usr/
}

package() {
    #Install hpctoolskit
    cd "$srcdir/trunk/BUILD/"
    make DESTDIR=${pkgdir} install
}



