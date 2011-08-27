# $Id: PKGBUILD 48231 2009-10-13 17:00:49Z GunsNRose$
# Maintainer : GunsNRose<3444542@163.com>
pkgname=s3c2440_boot_usb
_pkgname=s3c2410_boot_usb
pkgver=20060807
pkgrel=2
pkgdesc="S3C2440 boot usb for linux"
url="http://code.google.com/p/mini2440/downloads/list"

#install=${pkgname}.install
groups=('embedded')
P="${_pkgname}-${pkgver}"
#source=(http://mini2440.googlecode.com/files/${_pkgname}-${pkgver}.tar.bz2)
source=(http://mini2440.googlecode.com/files/${P}.tar.bz2)

arch=('i686' 'x86_64')
#makedepends=("xz-utils")
options=('emptydirs')
#backup=('')
depends=('kernel26>=2.6.31' 'kernel26<2.6.32' 'libusb')

license=('GPL-2')

md5sums=('4a49e6060b28af1795c3480aab9ba51d')
build() {
    cd $srcdir/${_pkgname}
    #diff -u s3c2410_boot_usb s3c2410_boot_usb_orgin/ > ../s3c2440_boot_usb.patch 
    #sed -e "s/0x33F80000/0x32000000/"  -i boot_usb.c || return 1
    #sed -e "s@define CHUNK_SIZE 100@define CHUNK_SIZE 1024@" -i boot_usb.c || return 1
	#sed -e "s@if (qt2410_send_file(KERNEL_RAM_BASE, prog, st.st_size)) {@if (qt2410_send_file(KERNEL_RAM_BASE, prog, st.st_size) < 0) {@" -i boot_usb.c || return 1

    patch -Np1 -i ${startdir}/${pkgname}.patch || return 1

    make || return 1
    install -D -m755 $_pkgname ${pkgdir}/usr/bin/${pkgname} || return 1
}
