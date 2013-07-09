# Maintainer: Ryon Sherman <ryon.sherman@gmail.com>

_pkgname="unix-privesc-check"

pkgname="${_pkgname}-svn"
pkgver=362
pkgrel=1
pkgdesc="Shell script to check for simple privilege escalation vectors on Unix systems."

provides=(${_pkgname})

arch=('any')
license=('GPL2')
url="http://pentestmonkey.net/tools/audit/${_pkgname}"

depends=('sh')
makedepends=('svn')

source=(
    "svn+http://${_pkgname}.googlecode.com/svn/trunk"
    "${_pkgname}.sh"
)
md5sums=(
    'SKIP'
    '8bac1805864188fd8ce5fd02adb7474b'
)

pkgver() {
  cd ${srcdir}/trunk
  svnversion | tr -d [A-z]
}

package() {
  cd ${srcdir}

  touch {files,privileged}_cache.temp

  install -d ${pkgdir}/usr/{bin,share/${_pkgname}}
  install -Dm0755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
  install -Dm0666 {files,privileged}_cache.temp ${pkgdir}/usr/share/${_pkgname}

  cp -r trunk/* ${pkgdir}/usr/share/${_pkgname}
}
