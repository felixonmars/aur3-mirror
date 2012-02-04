# Maintainer: Jan Lieven <jan [at] das [minus] labor [dot] org>
pkgname=opaf-svn
_pkgname=opaf
pkgver=2
pkgrel=2
pkgdesc="An open PDF analysis framework"
arch=(any)
url="http://opaf.googlecode.com/"
license=('GPL')
depends=(python-matplotlib
         python-ply
         python-networkx
         python-pygraphviz
         python-lxml)
optdepends=()
source=(opaf.sh)
_svntrunk=http://opaf.googlecode.com/svn/trunk/
build() {
  if [ -d ${srcdir}/${_pkgname}/.svn ]; then
    msg 'Updating...'
    svn up ${srcdir}/${_pkgname}
  else
    msg 'Checking out...'
    svn co ${_svntrunk} ${srcdir}/${_pkgname}
  fi
}

package() {
  cd ${srcdir}

  install -D -d ${_pkgname}/ ${pkgdir}/opt/opaf/
  install -m644 ${_pkgname}/*.py ${pkgdir}/opt/opaf/
  install -D -d ${_pkgname}/examples/ ${pkgdir}/opt/opaf/examples/
  install -m644 ${_pkgname}/examples/* ${pkgdir}/opt/opaf/examples/
  install -D -d ${_pkgname}/ply/ ${pkgdir}/opt/opaf/ply/
  install -m644  ${_pkgname}/ply/* ${pkgdir}/opt/opaf/ply/
  install -D -m755 opaf.sh ${pkgdir}/usr/bin/opaf.sh
}

# vim:set ts=2 sw=2 et:
sha256sums=('eece2dbc4923f933c7ea5a3c1cac67c3b081559e0a9d745bf299710bd58d1c3b')
