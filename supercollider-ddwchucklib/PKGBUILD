# Maintainer: Bernardo Barros <bernardobarros@NOSPAM.gmail.com>

pkgname=supercollider-ddwchucklib
pkgdesc="SuperCollider quark: Support for advanced algorithmic composition designs. Author: James Harkins."
_quark="ddwChucklib"
_path=dewdrop_lib/ddwChucklib
depends=('supercollider' 'supercollider-ddwprototype' 'supercollider-ddwcommon' 'supercollider-ddwguienhancements' 'supercollider-ddwmixerchannel' 'supercollider-ddwpatterns' 'supercollider-ddwtemperament')

pkgver=1978
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


