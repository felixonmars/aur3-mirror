# Maintainer: Emil Renner Berthing <esmil@mailme.dk>

pkgname=tayga
pkgver=0.9.2
pkgrel=1
pkgdesc="Simple, no-fuss NAT64 for Linux"
arch=(i686 x86_64)
url="http://www.litech.org/tayga/"
license=('GPLv2')
backup=('etc/tayga.conf')
source=("http://www.litech.org/tayga/tayga-$pkgver.tar.bz2")
depends=('glibc')
md5sums=('7a7b24165ce008df772f398d86fa280e')

build() {
  cd "$srcdir/tayga-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$srcdir/tayga-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/tayga-$pkgver"
  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/etc/tayga.conf.example" "$pkgdir/etc/tayga.conf"
  mkdir -p "$pkgdir/var/db/tayga"
}

# vim:set ts=2 sw=2 et:
