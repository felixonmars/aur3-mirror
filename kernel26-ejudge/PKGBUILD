# Maintainer: Bin Jin <bjin1990+arch [at] gmail [dot] com>

pkgname=kernel26-ejudge
basekernel=2.6.37.3
pkgver=2.6.37.3
pkgrel=1
pkgdesc="The Linux Kernel and modules, with ejudge kernel patch"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.kernel.org"
depends=('module-init-tools' 'mkinitcpio')
provides=(kernel26)
install=kernel26.install
source=("http://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${pkgver}.tar.bz2"
        "http://www.ejudge.ru/download/linux-${pkgver}-${pkgver}-cher1.diff"
        "kernel26.install")
md5sums=('b32fc95037e4e114fcfb33075bb30f46'
         'ae54e9c1a6491216d48754f760579b34'
         '384dc93ec14b3340176718cefd94a5e4')

LOCAL_VERSION="-cher1-ARCH"

build() {
    cd ${srcdir}/linux-${pkgver}
    
    patch -Np1 < ${startdir}/linux-${pkgver}-${pkgver}-cher1.diff
    zcat /proc/config.gz > .config
    make localmodconfig
    
    make -j3 || return 1
    
    mkdir -p ${pkgdir}/{lib/modules,boot}
    make INSTALL_MOD_PATH=${pkgdir} modules_install || return 1
    
    rm -rf ${pkgdir}/lib/firmware
    
    install -Dm644 "System.map" "${pkgdir}/boot/System.map26$LOCAL_VERSION"
    install -Dm644 "arch/x86/boot/bzImage" "${pkgdir}/boot/vmlinuz26$LOCAL_VERSION"
    
    sed -i \
        -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=\"$basekernel\"/" \
        -e "s/LOCAL_VERSION=.*/LOCAL_VERSION=\"$LOCAL_VERSION\"/" \
        $startdir/kernel26.install
}
