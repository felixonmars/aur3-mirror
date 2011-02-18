# Maintainer: Alessio Sergi <asergi [at] archlinux [dot] us>

pkgname=kdenlive-svn
_realname=kdenlive
pkgver=5425
pkgrel=1
pkgdesc="A non-linear video editor for Linux"
arch=('i686' 'x86_64')
url="http://kdenlive.sourceforge.net/"
license=('GPL')
depends=('hicolor-icon-theme' 'kdelibs' 'mlt-git' \
         'qimageblitz' 'qjson' 'shared-mime-info')
makedepends=('automoc4' 'cmake' 'subversion')
optdepends=('cdrkit: for creation of DVD ISO images'
            'dvdauthor: for creation of DVD'
            'dvgrab: for firewire capture'
            'ffmpeg: for webcam capture'
            'recordmydesktop: for screen capture'
            'xine-lib: for preview DVD') 
provides=(${_realname})
conflicts=(${_realname})
install=${pkgname}.install

_svntrunk=https://${_realname}.svn.sourceforge.net/svnroot/${_realname}/trunk/${_realname}
_svnmod=${_realname}

build() {
  cd "${srcdir}"

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} ${_svnmod} -r ${pkgver}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf build
  cp -r ${_svnmod} build
  cd build

  export LDFLAGS="${LDFLAGS} -lX11"
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=/usr/lib \
        -DLINK_LIBRARIES=-lX11
  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install
}
