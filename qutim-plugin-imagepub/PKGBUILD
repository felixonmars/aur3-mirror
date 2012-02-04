# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-plugin-imagepub
pkgver=0.1.4
pkgrel=1
pkgdesc="Imagepub plugin for Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('gcc' 'make')
depends=('qutim')
source=("http://boiler.co.ru/qutim/imagepub-${pkgver}.tar.gz")
md5sums=('8492b63e5f4ded75abce75f47c5621a4')

build() {
msg "Building and installing..."
   cd $srcdir/imagepub
   qmake || return 1
   make || return 1
   install -Dm 644 $srcdir/imagepub/libimagepub.so \
                   $pkgdir/usr/lib/qutim/libimagepub.so || return 1 
}
