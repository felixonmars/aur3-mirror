# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=notify-osd-icons
pkgver=0.7
pkgrel=2
pkgdesc=" Icons for Notify-OSD in Ubuntu style"
arch=('any')
url="https://launchpad.net/notify-osd"
license=('custom:Creative Commons Attribution-ShareAlike')
depends=('notify-osd')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.tar.gz)
md5sums=('d9ffee4f51e2c7bccda80aaef1aae7f8')

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
}
