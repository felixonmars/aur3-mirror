# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Paolo Giangrandi <paolo@luccalug.it>

pkgname=box2d-svn
pkgver=88
pkgrel=1
pkgdesc="2D rigid body simulation library for games"
url="http://www.box2d.org/"
license=('zlib')
arch=('i686' 'x86_64')
#depends=('glibc')
conflicts=('box2d')
provides=('box2d')
makedepends=('cmake' 'subversion')
source=()
md5sums=()

_svntrunk="http://box2d.googlecode.com/svn/trunk/"
_svnmod=box2d

build() {
  
  # getting box2d SVN
  cd ${srcdir}
  msg "Connecting to SVN server...."
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
  
  cd ${srcdir}/${_svnmod}/Box2D/
 
  msg "Starting build"
  [[ -d build ]] && rm -r build
  svn export . build && cd build 
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
	make DESTDIR=${pkgdir} install || return 1

  mkdir -p ${pkgdir}/usr/share/doc/box2d/
  cp -r ${srcdir}/${_svnmod}/Box2D/Documentation/* ${pkgdir}/usr/share/doc/box2d/
  find ${pkgdir}/usr/share/doc/box2d/ -type f|xargs chmod 644
  find ${pkgdir}/usr/share/doc/box2d/ -type d|xargs chmod 755

  install -Dm644 ${srcdir}/${_svnmod}/Box2D/License.txt ${pkgdir}/usr/share/licenses/box2d/LICENSE
}
# vim: sw=2 ts=2
