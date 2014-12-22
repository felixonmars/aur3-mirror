# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=gale
pkgver=1.1.r9.g417a5bf
pkgrel=1
pkgdesc="Instant messaging software from Caltech, similar to Zephyr"
arch=("i686" "x86_64")
url="http://gale.org/"
license=('GPL2')
depends=('adns' 'bash' 'gc' 'libiconv')
provides=('liboop')
install='gale.install'
source=("git+https://github.com/grawity/gale")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./g'
  #echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$pkgname"
  CFLAGS+=" -DNDEBUG -DHAVE_ICONV -DICONV_CONST="
  make distclean || true
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc
  make -j1
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  # 'make install' croaks if sbindir == bindir
  mv -f "$pkgdir/usr/sbin/gksign" "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/sbin"
}

# vim: ts=2:sw=2:et:ft=sh
