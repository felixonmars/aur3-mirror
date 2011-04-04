# Maintainer: Techlive Zheng <techlivezheng [at] gmail [dot] com>
# Contributor: Peter Bui <pnutzh4x0r@gmail.com>

_pkgname=rtl8192se
pkgname=rtl8192se-firmware
pkgdesc="Realtek 8192SE wireless chipset firmware"
pkgver=2.6.0019.1207.2010
pkgrel=1
license=("Realtek-Firmware-License")
source=("http://www.nd.edu/~pbui/scratch/aur/${_pkgname}_linux_${pkgver}.tar.gz")
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/"

package(){
    cd ${srcdir}/${_pkgname}_linux_${pkgver}

    install -D -m 644 firmware/RTL8192SE/Realtek-Firmware-License.txt ${pkgdir}/usr/share/licenses/rtl8192se-firmware/LICENSE
    install -D -m 644 firmware/RTL8192SE/rtl8192sfw492.bin ${pkgdir}/lib/firmware/RTL8192SE/rtl8192sfw492.bin
    install -D -m 644 firmware/RTL8192SE/rtl8192sfw74.bin  ${pkgdir}/lib/firmware/RTL8192SE/rtl8192sfw74.bin
    install -D -m 644 firmware/RTL8192SE/rtl8192sfw.bin    ${pkgdir}/lib/firmware/RTL8192SE/rtl8192sfw.bin

}

md5sums=('2c122c209784452fd5bbbad3ef1f7fa1')
