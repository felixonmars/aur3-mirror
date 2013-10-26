#Maintainer: Eduardo Büll <eduardo.bull@gmail.com> 
# -Many thanks to Cinelli for his rt3573 package, which I based this package upon
pkgname=rt3573sta-ashaffer-git
pkgver=14.7aa0186
pkgrel=1
pkgdesc="Ralink/MediaTek RT3573 device drivers patched by ashaffer to work properly on 64-bit systems"
arch=('i686' 'x86_64')
url="https://github.com/ashaffer/rt3573sta"
license=(GPL2)
makedepends=('linux-headers' 'git')
source=("git://github.com/ashaffer/rt3573sta.git"
	"Makefile.patch"
	"Makefile.6.patch"
	"config.mk.patch"
	"rtusb_dev_id.c.patch")
md5sums=('SKIP'
	 '2d8e5a1035bb7f73867bcbbfdead83c1'
	 '8518ffcdab1611759d1addcd82688f16'
	 '15291c38f6be17350893bcd0d3f0f149'
	 '1056a0a83f5c4aa8662ccf405ed24900')
install=$pkgname.install

_gitname="rt3573sta"

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $srcdir/$_gitname
  patch -Np2 < "$srcdir/Makefile.patch"
  patch -Np2 < "$srcdir/Makefile.6.patch"
  patch -Np2 < "$srcdir/config.mk.patch"
  patch -Np2 < "$srcdir/rtusb_dev_id.c.patch"
}

package() {
  cd $srcdir/$_gitname/
  make
  make MOD_NAME="rt3573sta" DAT_PATH="$pkgdir" DESTDIR="$pkgdir" install
  install -Dm 755 "os/linux/rt3573sta.ko" "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/rt3573sta.ko"
  install -Dm 644 "RT2870STA.dat" "$pkgdir/etc/Wireless/RT2870STA/RT2870STA.dat"
  install -Dm 644 "RT2870STACard.dat" "$pkgdir/etc/Wireless/RT2870STA/RT2870STACard.dat"
}