# Contributor Giuseppe Calderaro <giuseppecalderaro@gmail.com>
# Contributor Alessandro Sagratini <ale_sagra@hotmail.com>

pkgname=tiacx-ice
_kernver=2.6.29-ice
pkgver=20080210
pkgrel=1
pkgdesc="OpenSource module for Texas Instruments ACX100/ACX111 wireless chips. For kernel26-ice."
arch=('i686' 'x86_64')
url="http://acx100.sourceforge.net"
license=('MPL')
depends=('wireless_tools' 'tiacx-firmware' 'kernel26-ice')
install=tiacx-ice.install
source=(http://downloads.sourceforge.net/sourceforge/acx100/acx-$pkgver.tar.bz2
        kernel-2.6.27.patch)
md5sums=('7d5ce3215708e4e9f95cf567a9ee3a12'
         '9895f72f8d0c84956b0f6c3b16df0fe8')

build() {
    cd $startdir/src/acx-$pkgver
    patch -Np1 -i ../kernel-2.6.27.patch || return 1
    make -C /lib/modules/${_kernver}/build M=`pwd` || return 1
    install -D acx.ko $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/net/wireless/tiacx/acx.ko
    sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
