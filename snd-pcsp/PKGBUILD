# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=snd-pcsp
_basekernel=2.6.39
_kernver=${_basekernel}-ARCH
pkgver=${_basekernel}
pkgrel=1
pkgdesc="PC-Speaker driver for kernel26"
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL')
depends=('kernel26>=2.6.39' 'kernel26<2.6.40')
makedepends=('kernel26-headers>=2.6.39' 'kernel26-headers<2.6.40')
install="$pkgname.install"
source=("ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-$_basekernel.tar.bz2")
noextract=("linux-$_basekernel.tar.bz2")
md5sums=('1aab7a741abe08d42e8eccf20de61e05')

build() {
  (cd "$srcdir" && bsdtar -x -f "linux-$_basekernel.tar.bz2" "linux-$_basekernel/sound/drivers/pcsp")
  cd "$srcdir/linux-$_basekernel/sound/drivers/pcsp"
  sed -i -e 's/$(CONFIG_SND_PCSP)/m/' Makefile
  make -C "/lib/modules/$_kernver/build" M="$(pwd)" modules
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" "${srcdir}/../${pkgname}.install"
}

package() {
  cd "$srcdir/linux-$_basekernel/sound/drivers/pcsp"
  install -D -m644 snd-pcsp.ko "$pkgdir/lib/modules/$_kernver/extra/snd-pcsp.ko"
}

# vim:set ts=2 sw=2 et:
