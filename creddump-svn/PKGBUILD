# Maintainer: /dev/rs0 <rs0@secretco.de.com>

_pkgname="creddump"

pkgname="${_pkgname}-svn"
pkgrel=1
pkgver=2
pkgdesc="Extracts credentials from Windows registry hives."

provides=(${_pkgname})

arch=('any')
license=('BSD')
url="https://code.google.com/p/${_pkgname}"

depends=('python2')
makedepends=('svn')

source=("svn+http://${_pkgname}.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/trunk
  svnversion | tr -d [A-z]
}

package() {
  cd ${srcdir}/trunk

  install -d ${pkgdir}/usr/{bin,share/licenses/${_pkgname}}
  install -Dm0644 COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE

  cp -r framework ${pkgdir}/usr/share/${_pkgname}

  for file in *.py; do
    sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' $file
    install -Dm0755 $file ${pkgdir}/usr/share/${_pkgname}
    ln -s /usr/share/${_pkgname}/${file} ${pkgdir}/usr/bin/${file%.*}
  done
}
