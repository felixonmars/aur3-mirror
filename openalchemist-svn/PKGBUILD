# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=openalchemist-svn
pkgver=571
pkgrel=1
pkgdesc="Tetris like game, but where you can take your time."
arch=('i686' 'x86_64')
url="http://openalchemist.com/"
license=('GPL' 'CCPL:"by-sa"')
depends=('clanlib<2.1.0')
makedepends=('gcc' 'make' 'pkg-config' 'subversion' 'zip')
options=('!libtool')
provides=('openalchemist')
conflicts=('openalchemist')
source=()
md5sums=('')

_svnmod="openalchemist"
_svntrunk="https://openalchemist.svn.sourceforge.net/svnroot/openalchemist/trunk"

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

  install -m644 .desktop \
		${pkgdir}/usr/share/applications/${_svnmod}.desktop || return 1
  install -m644 data/logo.png \
		${pkgdir}/usr/share/pixmaps/${_svnmod}.png || return 1
  install -m644 data/logo_svg.svg \
		${pkgdir}/usr/share/pixmaps/${_svnmod}.svg || return 1

  # Removing unnecessary stuff
  rm ${pkgdir}/usr/share/${_svnmod}/*-LICENSE
}
