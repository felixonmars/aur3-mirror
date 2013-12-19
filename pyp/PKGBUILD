# Maintainer: Duong Pham <dthpham@gmail.com>
pkgname=pyp
pkgver=232
pkgrel=3
pkgdesc="A python-centric command line text manipulation tool similar to sed and awk"
arch=('any')
url="http://opensource.imageworks.com/?p=pyp"
license=('BSD')
depends=('python2')
makedepends=('subversion')
provides=('pyp')
conflicts=('pyp')

_svntrunk="http://pyp.googlecode.com/svn/trunk/"
_svnmod="pyp"

build() {
  cd ${srcdir}

  if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r $pkgver)
  else
     svn co "${_svntrunk}" --config-dir ./ -r "$pkgver" "${_svnmod}"
  fi
  
  msg "Applying patches..."
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' ${srcdir}/pyp/pyp
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/pyp/pyp" "${pkgdir}/usr/bin/"
}
