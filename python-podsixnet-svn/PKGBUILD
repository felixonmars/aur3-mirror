# Contributor: Franco Tortoriello <franco (d0t) tortoriello (at) gmail (d0t) com>

pkgname=python-podsixnet-svn
pkgver=152
pkgrel=6
pkgdesc="Python library for multiplayer networking games"
arch=(any)
url="http://mccormick.cx/projects/PodSixNet/"
license=('LGPL3')
depends=('python2')
makedepends=('subversion' 'python2-distribute')

_svntrunk="http://podsixnet.googlecode.com/svn/podsixnet/"
_svnmod="PodSixNet"

build() {
  cd ${srcdir}

  if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r ${pkgver})
  else
     svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_svnmod}-build
  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build
  python2 setup.py install --root=${pkgdir}
  cp -R examples "${pkgdir}/usr/lib/python2.7/site-packages/${_svnmod}"
  rm -rf ${pkgdir}/usr/lib/python2.7/site-packages/*.egg-info
}
