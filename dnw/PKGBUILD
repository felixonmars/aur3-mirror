# $Id: PKGBUILD 48231 2009-08-20 17:00:49Z tpowa $
# Maintainer : zlbgps<zlbgps@gmail.com>
pkgname=dnw
pkgver=0.1
pkgrel=1
pkgdesc="S3C2440 dnw for linux"
url="http://code.google.com/p/c8051f320dev"

install=${pkgname}.install

groups=('embedded')
P="${pkgname}-${pkgver}"
source=()
#source=(http://c8051f320dev.googlecode.com/files/${pkgname}_linux_latest.tgz)
arch=('i686' 'x86_64')
#makedepends=("xz-utils")
options=('emptydirs')
depends=('kernel26>=2.6.31' 'kernel26<2.6.32')

license=('GPL-2')

MOD_NAME=secbulk 
FILESDIR=files
build() {
    cp -R $startdir/$FILESDIR/* ${srcdir} || return 1
    cd $srcdir/$P
    echo $(pwd)
    pushd $pkgname
    sed -e "s|secbulk0|secbulk1|" -i ${pkgname}.c || return 1
    make || return 1
    install -D -m755 $pkgname ${pkgdir}/usr/bin/${pkgname} || return 1
    popd
    cd $MOD_NAME
    make || return 1 
    make -C /lib/modules/`uname -r`/build INSTALL_MOD_PATH=$startdir/pkg/ M=`pwd` modules_install || return 1
  #  install -Dm644 $MOD_NAME.ko ${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/usb/misc/$MOD_NAME.ko || return 1
}
