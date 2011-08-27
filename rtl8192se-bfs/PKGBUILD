# Maintainer: Techlive Zheng <techlivezheng [at] gmail [dot] com>
# Contributor: Peter Bui <pnutzh4x0r@gmail.com>

_kerver="2.6.39-bfs"
_pkgname=rtl8192se
pkgname=rtl8192se-bfs
pkgdesc="Realtek 8192SE wireless chipset drivers for kernel26-bfs."
pkgver=2.6.0019.1207.2010
pkgrel=4
license=("GPL")
depends=('kernel26-bfs>=2.6.27' 'kernel26-bfs<2.6.40' 'rtl8192se-firmware=2.6.0019.1207.2010')
makedepends=('kernel26-bfs-headers>=2.6.27' 'kernel26-bfs-headers<2.6.40')
install="rtl8192se-bfs.install"
source=("http://www.nd.edu/~pbui/scratch/aur/${_pkgname}_linux_${pkgver}.tar.gz")
changelog=Changelog
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/"

build() {
    cd ${srcdir}/${_pkgname}_linux_${pkgver}

    #sed -i 's/-DENABLE_LPS//' HAL/rtl8192/Makefile || return 1
    #sed -i 's/-DENABLE_LPS//' HAL/rtl8192/*/Makefile || return 1

    make KSRC=/lib/modules/${_kerver}/build LINUX_KSRC_MODULE=/lib/modules/${_kerver}/kernel/drivers/net/wireless || return 1
}

package(){
    cd ${srcdir}/${_pkgname}_linux_${pkgver}

    install -D -m 644 HAL/rtl8192/r8192se_pci.ko ${pkgdir}/lib/modules/${_kerver}/kernel/drivers/net/wireless/r8192se_pci.ko
}

md5sums=('2c122c209784452fd5bbbad3ef1f7fa1')
