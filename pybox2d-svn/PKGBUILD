# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=pybox2d-svn
pkgver=370
pkgrel=1
pkgdesc="python wrapper for Box2D"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pybox2d"
license=('GPL')
depends=('python2-pygame' 'swig')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=http://pybox2d.googlecode.com/svn/trunk/
_svnmod=pybox2d

build() {
  cd ${srcdir}
  
  if [ -d ${_svnmod}/.svn ]; then
  	(cd ${_svnmod} && svn up -r ${pkgver})
  else
  	svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cp -r ${_svnmod} $_svnmod-build
  cd ${_svnmod}-build

  python2 setup.py build
}

package() {
  cd ${srcdir}/${_svnmod}-build

  python2 setup.py install --root=${pkgdir} 
}
# vim: sw=2 ts=2 et:
