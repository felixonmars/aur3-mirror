# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=proxychains-ng
pkgver=4.7
pkgrel=1
pkgdesc="a hook preloader that allows to redirect TCP traffic of existing dynamically linked programs through one or more SOCKS or HTTP proxies"
arch=('i686' 'x86_64')
url="https://github.com/rofl0r/proxychains"
license=('GPL')
conflicts=('proxychains')
backup=('etc/proxychains.conf')
source=(http://downloads.sourceforge.net/project/$pkgname/proxychains-$pkgver.tar.bz2)
md5sums=('5c127db02feb45860feb887949955ecf')

build() {
  cd "$srcdir/proxychains-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/proxychains-$pkgver"
  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install-config
}

# vim:set ts=2 sw=2 et:
