# Maintainer: Techlive Zheng <techlivezheng@gmail.com>
# Contributor: Peter Bui <pnutzh4x0r@gmail.com>

pkgname=rtl8192se
pkgdesc="Drivers for Realtek 8192SE wireless chipset"
pkgver=2.6.0019.1207.2010
pkgrel=5
license=("GPL")
depends=('kernel26>=2.6.27' 'kernel26<2.6.40' 'rtl8192se-firmware=2.6.0019.1207.2010')
makedepends=('kernel26-headers>=2.6.27' 'kernel26-headers<2.6.40')
install="${pkgname}.install"
source=("http://www.nd.edu/~pbui/scratch/aur/${pkgname}_linux_${pkgver}.tar.gz")
changelog=Changelog
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/"

build() {
    cd ${srcdir}/${pkgname}_linux_${pkgver}

    #sed -i 's/-DENABLE_LPS//' HAL/rtl8192/Makefile || return 1
    #sed -i 's/-DENABLE_LPS//' HAL/rtl8192/*/Makefile || return 1

    make || return 1
}

package(){
    cd ${srcdir}/${pkgname}_linux_${pkgver}

    install -D -m 644 HAL/rtl8192/r8192se_pci.ko ${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/net/wireless/r8192se_pci.ko
}

md5sums=('2c122c209784452fd5bbbad3ef1f7fa1')
