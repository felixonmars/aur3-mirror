# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=glict-svn
pkgver=114
pkgrel=2
pkgdesc="Graphics Library Interface Creation Toolkit (GLICT)."
arch=('i686' 'x86_64')
url="http://glict.sourceforge.net/"
license=('LGPL')
depends=('mesa')
makedepends=('autoconf' 'automake' 'gcc' 'make' 'pkg-config' 'subversion')
options=('!libtool')
provides=('glict')
conflicts=('glict')
source=()
md5sums=('')

_svnmod="glict"
_svntrunk="https://glict.svn.sourceforge.net/svnroot/glict/trunk/glict"

build() { 
  cd ${srcdir}

  #####
  msg "Getting sources..."
  if [ -d ${_svnmod}/.svn ]; then
    cd ${_svnmod} && svn up -r ${pkgver}
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    cd ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  #####

  # Generating build system
  ./autogen.sh || return 1

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
}

package() {
  cd ${srcdir}/${_svnmod}

  make DESTDIR=${pkgdir} install || return 1
}
