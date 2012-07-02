# Maintainer: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
# Contributor: Paolo Stivanin <admin@polslinux.it>
#              Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>

pkgname=('psmouse-alps')
_kernelname=${pkgname#linux}
_basekernel=3.4
_patchver=${_basekernel}.4
pkgver=0.10
pkgrel=${_patchver}
pkgdesc="psmouse kernel module with support for alpsv4 touchpad"
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('linux-headers')
options=('!strip')
install=psmouse.install
source=(http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basekernel}.tar.bz2
http://www.kernel.org/pub/linux/kernel/v3.x/patch-${_patchver}.bz2
alpsv4.patch
)

build() {
cd ${srcdir}/linux-${_basekernel}
patch -p1 -i ${srcdir}/patch-${_patchver}
patch -p1 -i ${srcdir}/alpsv4.patch
cd ${srcdir}/linux-${_basekernel}/drivers/input/mouse
make -C /usr/src/linux-`uname -r`/ M=`pwd` psmouse.ko
gzip -9 psmouse.ko
install -D -m 0644 psmouse.ko.gz ${pkgdir}/lib/modules/`uname -r`/updates/drivers/input/mouse/psmouse.ko.gz
}

md5sums=('146af0160fc7a60cf9acf44aec13482b'
         '51d5b74c3523c5dd8d0f4d1a7abb68be'
         '4c78590a71feecbe06e65e30deb54142')
