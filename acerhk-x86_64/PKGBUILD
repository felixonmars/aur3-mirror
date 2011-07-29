# Contributor: Thiago Mendes <thimns@gmail.com>

pkgname=acerhk-x86_64
pkgver=0.5.35
pkgrel=1
pkgdesc="Acer hotkey driver for Arch x86_64"
arch=('x86_64')
_kernver=`uname -r`
url="http://www.cakey.de/acerhk"
depends=(kernel26) # Tested with kernel26
license=('GPL')
source=(http://thim.110mb.com/acerhk/acerhk-${pkgver}.tgz http://thim.110mb.com/acerhk/amd64fix.diff )
md5sums=('05255919f312cb76af473a760c284433' 'efe0ebb7ba460be2aa41ac857845be47')

build() {
cd ${startdir}/src/acerhk-${pkgver}
patch acerhk.c < ../../amd64fix.diff
./configure --prefix=/usr
make CFLAGS=''|| return 1

mkdir -p ${startdir}/pkg/lib/modules/${_kernver}/extra

cp -v acerhk.ko ${startdir}/pkg/lib/modules/${_kernver}/extra/

}
