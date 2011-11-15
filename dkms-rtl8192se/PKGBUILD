# Maintainer: Jason Melton <jason.melton@gmail.com>

pkgname=dkms-rtl8192se
_pkgname=rtl8192se

pkgver=2.6.0019.1207.2010

pkgrel=8
pkgdesc="DKMS controlled drivers for Realtek 8192SE wireless chipset"
arch=('any')
url="http://www.realtek.com.tw/"
license=('GPL')
depends=('dkms')
provides=('rtl8192se')
conflicts=('rtl8192se')
install=${_pkgname}.install

source=("http://www.nd.edu/~pbui/scratch/aur/${_pkgname}_linux_${pkgver}.tar.gz"
	dkms.conf)

package() {
    cd ${srcdir}/${_pkgname}_linux_${pkgver}

    # copy firmware
    mkdir -p                    ${pkgdir}/lib/firmware
    cp -rf firmware/RTL8192SE   ${pkgdir}/lib/firmware
    
    mkdir -p                    ${pkgdir}/usr/src/${_pkgname}-${pkgver} 
    cp -a                   *   ${pkgdir}/usr/src/${_pkgname}-${pkgver} 
    cp ${srcdir}/dkms.conf      ${pkgdir}/usr/src/${_pkgname}-${pkgver}
}

md5sums=('2c122c209784452fd5bbbad3ef1f7fa1'
         'fa2a04e354aa500abf80f3b01a9bab3a')
