# Maintainer: Dennis Bachmann < dennis.bachmann(at)gmail.com >
# Based on R8168 http://aur.archlinux.org/packages.php?ID=27000
pkgname=r8169
pkgver=6.013.00
pkgrel=1
_kernver=`uname -r`
pkgdesc="A kernel module with support to realtek 8169 network cards"
url="http://www.realtek.com.tw"
license="realtek"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=(kernel26-headers)
provides=()
conflicts=()
source=(ftp://WebUser:pGL7E6v@209.222.7.36/cn/nic/r8169-6.013.00.tar.bz2 fix_to_2_6_36.patch)
md5sums=('5cbf92304fe64345b1838b7664701afa' '5f84953921a0a60d089f33f24faee462')
build() {
  
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -p1 -i ${startdir}/fix_to_2_6_36.patch
  make clean modules || return 1
  #Install kernel module
  #install -D -m644 src/r8169.ko ${pkgdir}/lib/modules/${_kernver}/kernel/drivers/net/r8169.ko
  install -D -m644 src/r8169.ko ${pkgdir}/lib/modules/${_kernver}/updates/r8169.ko
  
}
