# Maintainer: kfgz <kfgz at interia pl>
# Contributor: hauzer <alokinpwn at gmail dot com>

pkgname=cddetect
pkgver=2.1
pkgrel=1
pkgdesc="This program tries to detect the type of a CD/DVD without mounting it. It detects audio, ISO, VCD, SVCD and Video-DVD."
arch=('i686' 'x86_64')
url="http://www.bellut.net/projects.html"
license=('GPL2')
source=("http://www.bellut.net/files/${pkgname}-${pkgver}.tar.gz"
        "limits.patch")
md5sums=('b57bd61f2fc3b46e60daf2dda56fbde1'
         'bd09d9131310cb9f2a64eb34b2f0c268')

build() {
  cd "${srcdir}"
  patch ${pkgname}.c limits.patch
  make
}

package() {
  mkdir -p "${pkgdir}"/usr/bin
  install -m755 "${srcdir}"/${pkgname} "${pkgdir}"/usr/bin
}
