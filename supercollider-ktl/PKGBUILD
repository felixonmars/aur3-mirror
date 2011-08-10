# Maintainer: Bernardo Barros <bernardobarros@NOSPAM.gmail.com>

pkgname=supercollider-ktl
pkgdesc="SuperCollider quark: Classes for using various controllers. Do not install this quark simultaneously with JITMIDIKtl. Author: Alberto de Campo, Marije Baalman."
_quark="Ktl"
_path=Ktl
depends=('supercollider')

pkgver=1893
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


