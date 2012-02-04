# Maintainer: Your Name <iam at redsquirrel dot tk>

pkgname=trpex
pkgver=1.0
pkgrel=6
pkgdesc="A simple tool to extract files and info from a PS3 game's TROPHY.TRP"
arch=('i686' 'x86_64')
url="http://www.redsquirrel87.com/trpex.html"
license=('GPL3')
makedepends=('gcc')
install='trpex.install'
source=(http://www.redsquirrel87.com/files/trpex-src-AUR-1.0.tar.gz)
md5sums=('f759821d85048ae8daedeffba5d8451c')

build() {
  cd $srcdir/sources
  gcc main.c -o trpex
}

package() {
  install -Dm755 "${srcdir}/sources/trpex" "${pkgdir}/usr/bin/trpex"
}
