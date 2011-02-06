# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=aavga
pkgver=1.0rc1
pkgrel=1
pkgdesc="A drop-in replacement for SVGAlib replacing graphics output by ASCII art"
arch=('i686' 'x86_64')
url="http://aa-project.sourceforge.net/$pkgname/"
license=('GPL')
depends=('aalib')
source=(http://downloads.sourceforge.net/aa-project/$pkgname-$pkgver.tar.gz)
md5sums=('75c7c0be6d22ef52768568d5ec5c5c05')

build() {
  cd $pkgname-1.0

  gcc ${CFLAGS} -Wl,-soname,libvga.so -o $pkgname.so -shared -nostdlib -fPIC \
	$pkgname.c -laa -lX11 -lm -lgpm -lc -lncurses || return 1

  install -Dm644 $pkgname.so "$pkgdir"/usr/lib/$pkgname.so
}

# vim:set ts=2 sw=2 et:
