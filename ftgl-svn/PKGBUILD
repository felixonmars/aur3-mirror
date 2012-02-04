# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=ftgl-svn
pkgver=1261
pkgrel=1
pkgdesc="A font rendering library for OpenGL applications."
arch=('i686' 'x86_64')
url="http://ftgl.sourceforge.net/"
license=('LGPL')
depends=('freetype2' 'freeglut' 'ttf-dejavu')
makedepends=('autoconf' 'automake' 'doxygen' 'gcc' 'make' 'pkg-config' 'subversion')
options=('!libtool')
provides=('ftgl')
conflicts=('ftgl')
source=()
md5sums=('')

_svnmod="ftgl"
_svntrunk="https://ftgl.svn.sourceforge.net/svnroot/ftgl/trunk"

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
	      --disable-static \
	      --with-pic

  make || return 1
}

package() {
  cd ${srcdir}/${_svnmod}

  make DESTDIR=${pkgdir} install || return 1
}
