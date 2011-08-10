# Maintainer: Bernardo Barros <bernardobarros@NOSPAM.gmail.com>

pkgname=supercollider-ddwpeakmonitor
pkgdesc="SuperCollider quark: A simple graphic monitor that tracks the peak values of a signal. Useful to check for clipping Author: James Harkins."
_quark="ddwPeakMonitor"
_path=dewdrop_lib/ddwPeakMonitor
depends=('supercollider' 'supercollider-ddwguienhancements')

pkgver=1652
pkgrel=1
arch=('any')
url="http://quarks.sourceforge.net/"
license=('GPL3')
groups=('supercollider-quarks')
makedepends=('subversion')

_svntrunk="https://quarks.svn.sourceforge.net/svnroot/quarks/${_path}"
_svnmod="${_quark}"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
}

package() {
  cd "${srcdir}/${_quark}"
  mkdir -p "${pkgdir}/usr/share/SuperCollider/Extentions/${_quark}"
  cp -r $srcdir/${_quark}/*  "${pkgdir}/usr/share/SuperCollider/Extentions/${_quark}"
}


