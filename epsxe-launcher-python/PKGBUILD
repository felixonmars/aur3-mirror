# Contributor: Swen Simon <swsimon at gmail dot com>
# Maintainer: Swen Simon <swsimon at gmail dot com>

pkgname=epsxe-launcher-python
pkgver=0.1
pkgrel=3
pkgdesc="Python launcher for epsxe"
url="http://epsxe.com"
depends=('epsxe' 'python')
conflicts=('epsxe-launcher-bash')
arch=('i686' 'x86_64')
license=('custom')
source=(epsxe) 
md5sums=('a86fcdd7db45e132931958d0757abbb4')

build() {
  cd $startdir/src
  
  mkdir -p $startdir/pkg/usr/bin

  # installing the launcher
  install -Dm755 $startdir/src/epsxe $startdir/pkg/usr/bin/epsxe
}
