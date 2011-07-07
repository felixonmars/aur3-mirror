# Maintainer: Mario Kozjak <kozjakm1 at google's mail dot com!> and "archman-cro" at bbs.archlinux.org
pkgname=hydrogen-svn
pkgver=2257
pkgrel=1
pkgdesc="Drum Machine and Pattern-based Sequencer"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.hydrogen-music.org/"
depends=('jack' 'liblrdf' 'qt' 'lash' 'libarchive')
provides=('hydrogen')
conflicts=('hydrogen')

_svntrunk=http://svn.assembla.com/svn/hydrogen/trunk
_svnmod=hydrogen

build() {
  cd "${srcdir}"

  if [ -d $_svnmod/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  mkdir "${srcdir}/${_svnmod}-build/build"
}

package() {  
  cd "${srcdir}/${_svnmod}-build/build"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWANT_LASH:BOOL=ON -DWANT_LIBARCHIVE:BOOL=ON ..
  make DESTDIR="${pkgdir}" install
}
