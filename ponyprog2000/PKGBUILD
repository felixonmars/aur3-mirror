# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# Maintainer: Alex Petrov <a-y-p@mail.ru>

pkgname=ponyprog2000
pkgver=2.08c
pkgrel=1
pkgdesc="Device Programmer Software"
url="http://www.lancos.com/prog.html"
license=('GPL')
depends=('lesstif' 'libxmu' 'gcc-libs')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/project/ponyprog/PonyProg%20sources/2.08c/PonyProg2000-$pkgver.tar.gz		
        ponyprog2000-makefile-fix)
md5sums=('c2dadda3d6b8096fa873240ad1d51f1a'
         '1c60adc3d56d901c62323364aa4f8f73')
build() {
  cd ${srcdir}/PonyProg2000-$pkgver
  patch -p0 < ../ponyprog2000-makefile-fix
  x=${PWD//\//\\\/}
  sed -i "s@INSTALL_PREFIX = /usr/local@INSTALL_PREFIX = ${pkgdir}@" v/Config.mk
  sed -i "s@HOMEV = your_ponyprog_path/software/v@HOMEV = $x/v@" v/Config.mk
  make CXX=g++ CC=gcc || return 1
  install -d ${pkgdir}/bin/
  install -m 755 ${srcdir}/PonyProg2000-$pkgver/bin/ponyprog2000 \
  ${pkgdir}/bin/
}

