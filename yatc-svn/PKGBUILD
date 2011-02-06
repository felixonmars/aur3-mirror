# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=yatc-svn
pkgver=5504
pkgrel=1
pkgdesc="A client for any game that uses Tibia-compatible protocol."
arch=('i686' 'x86_64')
url="http://yatc.vucica.net/"
license=('GPL')
depends=('sdl_gfx' 'gmp' 'glict-svn>=105')
makedepends=('autoconf' 'automake' 'gcc' 'imagemagick' 'make' 'pkg-config' 'subversion')
options=('!libtool')
provides=('yatc')
conflicts=('yatc')
source=()
md5sums=('')

_svnmod="yatc"
_svntrunk="https://opentibia.svn.sourceforge.net/svnroot/opentibia/yatc/trunk"

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
  install -d ${pkgdir}/usr/share/{applications,pixmaps} || return 1

  make DESTDIR=${pkgdir} install || return 1

  install -m644 ${srcdir}/${_svnmod}/debian/${_svnmod}.desktop \
		${pkgdir}/usr/share/applications/ || return 1
  install -m644 ${_svnmod}.ico.png ${pkgdir}/usr/share/pixmaps/ || return 1
}
