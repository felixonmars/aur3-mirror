# Author: Christoph Jaeger <christophjaeger@linux.com>
# Maintainer: Marc Rozanc <marc@rozanc.fr>

pkgname="clevo-wmi"
pkgver="0.9.6"
pkgrel=5
pkgdesc='A reverse engineering driver for the Clevo P15xSM/P15xEM/P17xSM/P15xEM/W230ST/W350STQ/W370ST/W650SR/W670SR/W740SU backlight keyboard, by Christoph Jaeger'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26&s=82130b57e71bd5b6ea569abc1424025c6f8d412d'
makedepends=('git')
conflicts=("clevo_wmi-git" "clevo-wmi-dkms" "tuxedo-wmi" "tuxedo-wmi-dkms")
source=("http://repo.rozanc.fr/sources/clevo-wmi-${pkgver}.src.tar.gz")
md5sums=('b4c4046799dcf4497b75b794659fcae3')
install='clevo-wmi.install'

build() {
    cd "${srcdir}/clevo-wmi-${pkgver}/src"
    make
}

package() {
    cd "${srcdir}/clevo-wmi-${pkgver}/src"
    
    _PACKAGES=`pacman -Qsq linux`
    _KERNELS=`pacman -Ql $_packages | grep /modules.alias.bin | sed 's/.*\/lib\/modules\/\(.*\)\/modules.alias.bin/\1/g'`

    # Find all extramodules directories
    _EXTRAMODULES=`find /usr/lib/modules -name version | sed 's|\/usr\/lib\/modules\/||; s|\/version||'`

    # Loop through all detected kernels
    for _kernver in $_KERNELS; do
        # Loop through all detected extramodules directories
        for _moduledirs in $_EXTRAMODULES; do
            # Check which extramodules directory corresponds with the built module
            if [ `cat "/usr/lib/modules/${_moduledirs}/version"` = $_kernver ]; then
                mkdir -p "${pkgdir}/usr/lib/modules/${_moduledirs}/"
                install -m644 clevo-wmi.ko "${pkgdir}/usr/lib/modules/${_moduledirs}/"
                gzip "${pkgdir}/usr/lib/modules/${_moduledirs}/clevo-wmi.ko"
            fi
        done
    done
}

