# Contributor: lucke <lucke at o2 dot pl>

pkgname=exmap
pkgver=0.10
pkgrel=10
pkgdesc="Memory analysis tool which allows you to accurately determine how much physical memory and swap is used by individual processes and shared libraries."
url="http://www.berthels.co.uk/exmap/"
license="GPL"
arch=('i686' 'x86_64')
depends=('pcre' 'boost' 'gtkmm')
install=exmap.install
source=(http://www.berthels.co.uk/exmap/download/$pkgname-$pkgver.tgz
	gcc44.patch
	kernel31.patch
	64bit.patch)

md5sums=('b4f87fa02f6a218416b77ad4b9f48d74'
         'd1ffb5cef6b7d43a0cb3fdeb2e6fe9e9'
         'ba7975378837194d5f4cd37d501ea994'
  	 'bcc178bee5f503e69f2f56eac50b8435')

_kernver=2.6.32-ARCH

build() {
  unset LDFLAGS
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../gcc44.patch || return 1
  patch -Np1 -i ../kernel31.patch || return 1
  patch -Np1 -i ../64bit.patch || return 1
  sed -i -e "s#\$(shell uname -r)#${_kernver}#g" $startdir/src/$pkgname-$pkgver/kernel/Makefile 
  make || return 1
  install -D -m755 src/gexmap $startdir/pkg/usr/bin/gexmap
  install -D -m755 kernel/exmap.ko $startdir/pkg/lib/modules/$_kernver/misc/exmap.ko
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/$pkgname.install
}
