# Contributor: Charles Lindsay <charles@chaoslizard.org>
# Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=dzip
pkgver=2.9
pkgrel=3
pkgdesc="A lightweight file compression program originally for Quake demos"
arch=('i686' 'x86_64')
url="http://speeddemosarchive.com/dzip/"
license=('custom')
depends=('glibc')
source=('http://speeddemosarchive.com/${pkgname}/dz29src.zip' 'license.txt')
md5sums=('b02d69c7c6ee491380d77f26c6f5a6e0' 81a34dd783e5bfc8d3cb634c439e133b)

build() {
  cd ${srcdir}
  install -D Makefile.linux Makefile
  make 
  install -Dm 755 dzip ${pkgdir}/usr/bin/dzip
  install -Dm 644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE 
}
