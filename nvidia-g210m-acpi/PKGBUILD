# For ArchLinux by Joël Porquet
# Maintainaer: Juan Matias Granda <insulae gmail com>

pkgname=nvidia-g210m-acpi
pkgver=0.1.0
pkgrel=3
pkgdesc="Switch off nVidia GeForce G210M card for hybrid graphic laptops (Asus UL30VT, UL50V, UL80VT)"
url="https://launchpad.net/~asus-ul30"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('linux-headers')
source=(nvidia_g210m_acpi.c Makefile)
install=nvidia-g210m-acpi.install

build() {
	cd "${srcdir}"

    # compile kernel module and install it
    make || return 1
    make INSTALL_MOD_PATH="${pkgdir}" install || return 1
}

md5sums=(
         '55506ede888b3dd5151e34c97a30223f '
         '5129336f644dde1db05226423b31a4cf'
         )
