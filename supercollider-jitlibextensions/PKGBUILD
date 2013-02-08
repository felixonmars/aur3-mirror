# Maintainer: Ciprian Ilies <ciliesj@NOSPAM.gmail.com>
# Contributor: Bernardo Barros <bernardobarros@NOSPAM.gmail.com>

pkgname=supercollider-jitlibextensions
pkgdesc="SuperCollider quark: Some extensions to the common JITLib classes, only for SC 3.4 (earlier versions include these classes in common)  Author: Alberto de Campo, Julian Rohrhuber."
_quark="JITLib extensions"
_path=JITLibExtensions
depends=('supercollider')

pkgver=2413
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

  if [ -d "$_svnmod"/.svn ]; then
    (cd "$_svnmod" && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
}

package() {
  cd "${srcdir}/${_quark}"
  mkdir -p "${pkgdir}/usr/share/SuperCollider/Extentions/${_quark}"
  cp -r $srcdir/"${_quark}"/*  "${pkgdir}/usr/share/SuperCollider/Extentions/${_quark}"
}


