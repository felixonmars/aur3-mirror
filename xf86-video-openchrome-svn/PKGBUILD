# Contributor: Paul Burton <paulburton89@gmail.com>

pkgname=xf86-video-openchrome-svn
pkgver=933
pkgrel=1
pkgdesc="Driver Openchrome SVN pour les cartes graphiques VIA Unichrome Pro."
license=('GPL2')
url="http://openchrome.org"
arch=('i686' 'x86_64')
depends=('intltool' 'xf86driproto' 'glproto' 'mesa' 'libxvmc')
makedepends=('pkgconfig' 'subversion' 'intltool' 'libtool' 'automake>=1.7.0' 'xorg-server-devel')
conflicts=('xf86-video-openchrome')
provides=('xf86-video-openchrome')
source=()
md5sums=()

_svntrunk="http://svn.openchrome.org/svn/trunk/"
_svnmod="openchrome"

build() {
  cd ${srcdir}
  
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r ${_svnmod} {$_svnmod-build}
  cd ${_svnmod-build}

  ./autogen.sh --prefix=/usr || return 1
  make || return 1
}

package(){
  cd ${srcdir}/${_svnmod-build}
  make DESTDIR=${pkgdir} install
}
