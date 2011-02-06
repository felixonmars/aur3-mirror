# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=(chuck-extra)
pkgver=1.2.1.3
pkgrel=2
pkgdesc="Documentation and examples for ChucK, the concurrent and on-the-fly audio programming language."
arch=('i686' 'x86_64')
url="http://chuck.cs.princeton.edu/"
license=('GPL')
source=("${url}release/files/${pkgname%%-extra}-${pkgver}.tgz")
md5sums=('ac8459b4067c2491fbdeb61d122a5985')

build() {
  cd $srcdir/${pkgname%%-extra}-${pkgver}
  
  mkdir -p ${pkgdir}/usr/share/licenses/chuck || return 1
  mkdir -p ${pkgdir}/usr/share/chuck || return 1
  cp COPYING ${pkgdir}/usr/share/licenses/chuck/LICENSE || return 1
  cp -R doc examples ${pkgdir}/usr/share/chuck || return 1
}
