# Contributor: fauno <fauno@parabola.nu>
pkgname=memlockd
pkgver=1.1.1
pkgrel=1
pkgdesc="daemon that locks files into memory"
arch=('i686' 'x86_64')
url="http://doc.coker.com.au/projects/memlockd/"
license=('GPL3')
depends=('glibc')
# main site doesn't announce 1.1.1
source=(http://ftp.de.debian.org/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.gz)
install=${pkgname}.install
backup=(etc/memlockd.cfg)
md5sums=('5e7a895b032eaa55f8cf15104e43364d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d -m 750 "${pkgdir}/usr/lib/memlockd" "${pkgdir}/etc/memlockd.d"
  install -D -m 644 memlockd.8 "${pkgdir}/usr/share/man/man8/memlockd.8"
  install -D -m 755 memlockd "${pkgdir}/usr/bin/memlockd"
  install -D -m 640 memlockd.cfg "${pkgdir}/etc/memlockd.cfg"
  install -D -m 644 memlockd.service "${pkgdir}/usr/lib/systemd/system/memlockd.service"
}
