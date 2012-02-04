# Maintainer: Henry Jensen <hjensen@delilinux.de>

pkgname=redirfs-modules
pkgver=0.6
pkgrel=1
pkgdesc="Redirecting FileSystem with Anti-Virus Filter - kernel modules"
arch=('i686' 'x86_64')
url="http://www.redirfs.org"
license=('GPLv3')
install=redirfs.install
depends=('glibc' 'kernel26')
source=(http://www.redirfs.org/packages/redirfs-$pkgver.tar.gz \
        http://www.redirfs.org/packages/avflt-0.4.tar.gz)
md5sums=('1f0dd5946461bc243396342c44330c0f'
         'a7d667cbf3b7a2539aaba6cdf59654de')
build() {
  cd "$srcdir/redirfs-$pkgver"

  make -C /lib/modules/`uname -r`/build M=`pwd` modules || return 1
  install -D -m644 redirfs.ko $startdir/pkg/lib/modules/`uname -r`/misc/redirfs.ko || return 1
  
  cd "$srcdir/avflt-0.4"
  cp $srcdir/redirfs-$pkgver/Module.symvers .
  make -C /lib/modules/`uname -r`/build M=`pwd` EXTRA_CFLAGS=-I"$srcdir/redirfs-$pkgver" modules || return 1
  install -D -m644 avflt.ko $startdir/pkg/lib/modules/`uname -r`/misc/avflt.ko || return 1
  
}

