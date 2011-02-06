# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=quad-ren-svn
pkgver=403
pkgrel=1
pkgdesc="Resolution independent 2D graphics engine."
arch=('i686' 'x86_64')
url="http://quad-ren.sourceforge.net/"
license=('LGPL')
depends=('libpng' 'mesa' 'sdl')
makedepends=('autoconf' 'automake' 'gcc' 'libtool' 'make' 'pkg-config' 'subversion')
options=('!libtool')
provides=('quad-ren')
conflicts=('quad-ren')
source=()
md5sums=('')

_svnmod="quad-ren"
_svntrunk="https://quad-ren.svn.sourceforge.net/svnroot/quad-ren/trunk"

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
  ./setup.sh || return 1

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
