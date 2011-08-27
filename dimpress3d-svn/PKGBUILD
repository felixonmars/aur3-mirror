# Contributor: Flamelab <panosfilip@gmail.com>

pkgname=dimpress3d-svn
pkgver=187
pkgrel=1
pkgdesc="A program which allows users to create presentations to a three dimensional environment"
arch=(i686 x86_64)
url="http://code.google.com/p/dimpress3d/"
license=('GPL3')
depends=('qt' 'kdelibs')
makedepends=('cmake>=2.4' 'automoc4' 'subversion')

_svntrunk="http://dimpress3d.googlecode.com/svn/trunk/"
_svnmod="dimpress3d"

build() {
  cd ${srcdir}

  if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r $pkgver)
  else
     svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_svnmod}-build
  cp -r ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
  cd ${srcdir}/${_svnmod}-build

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DENABLE_ARGB=ON \
        -DCMAKE_BUILD_TYPE=Release || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
