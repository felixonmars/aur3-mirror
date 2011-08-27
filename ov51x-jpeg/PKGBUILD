# Contributor: Marco Maso <demind@gmail.com>

_kernver=$(uname -r)
pkgname=ov51x-jpeg
pkgver=1.5.9
pkgrel=7
pkgdesc="Kernel Module with support for ov51x webcams (includes Sony eyeToy)"
arch=('i686' 'x86_64')
url="http://www.rastageeks.org/ov51x-jpeg/index.php/Main_Page"
license=('GPL')
makedepends=(kernel26-headers)
install=ov51x-jpeg.install
source=(http://www.rastageeks.org/downloads/$pkgname/$pkgname-$pkgver.tar.gz
        kernel_messages.patch
        ov51x-jpeg-2.6.29.patch
        ov51x-jpeg-2.6.30.patch
        ov51x-jpeg-2.6.36.patch
        noowner.patch
        autoconf.patch
        v4l2.patch
        mutex.patch)
md5sums=('95041de8e908f1548df3d4e1f6ed2a94'
         '7141cac1ce34fd3e5d0e8c42b70e0529'
         'a970a1648c25dc37194c9c8a6d2d4673'
         'd547ad1585216350157a0777fb79a774'
         'c5b8e3155b840c799258fe7fd0d7a22a'
         'f34082a1e61397b7b93d33998c8071f6'
         '72fca88197df40aca355ee400cda745a'
         '08fca890a9bb21f1815d3f006a4f9cd9'
         '8830678bb2de8a3c320d330200aa747c')

build() {
  cd $srcdir/$pkgname-$pkgver

  patch -Np1 -i ../kernel_messages.patch
  patch -Np1 -i ../ov51x-jpeg-2.6.29.patch
  patch -Np1 -i ../ov51x-jpeg-2.6.30.patch
  patch -Np1 -i ../noowner.patch
  patch -Np1 -i ../autoconf.patch
  patch -Np1 -i ../v4l2.patch
  patch -Np1 -i ../ov51x-jpeg-2.6.36.patch
  patch -Np1 -i ../mutex.patch

  #Change MakeFile to build for specified kernver
  sed -i -e "s/\$(shell uname -r)/${_kernver}/" $srcdir/$pkgname-$pkgver/Makefile

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m644 ov51x-jpeg.ko $pkgdir/lib/modules/${_kernver}/kernel/drivers/media/video/usbvideo/ov51x-jpeg.ko
}
