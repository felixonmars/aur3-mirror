# Maintainer: Artur "licho" Kaleta <akaleta91@gmail.com>

pkgname=zram
pkgdesc="zRAM based Ramdrive and Swap startup scripts."


url="https://bitbucket.org/licho/zram-utils"
license=("MIT")

arch=(any)
makedepends=("mercurial")

pkgver=0.3
pkgrel=1

source=("hg+https://bitbucket.org/licho/zram-utils#tag=v$pkgver")
md5sums=('SKIP')
sha1sums=('SKIP')


build() {
	cd "$srcdir/zram-utils"
	echo "zram" > zram.conf
	
}

package() {
	cd "$srcdir/zram-utils"
  
  install -m 755 -d $pkgdir/usr/lib/systemd/system
  install -m 755 -d $pkgdir/usr/lib/modules-load.d
  install -m 755 -d $pkgdir/usr/sbin
  install -m 755 -d $pkgdir/mnt/zdisk
  install -m 755 -d $pkgdir/var/lib/zdisk
  
  install -m 644 -t $pkgdir/usr/lib/systemd/system *.service
  install -m 644 -t $pkgdir/usr/lib/modules-load.d zram.conf
  install -m 750 -t $pkgdir/usr/sbin *.sh
}
