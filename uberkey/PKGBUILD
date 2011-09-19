# Maintainer: lilydjwg <lilydjwg@gmail.com>
pkgname=uberkey
pkgver=1.2
pkgrel=1
pkgdesc="uberkey is a keylogger for x86 systems."
arch=(i686 x86_64)
url="http://freshmeat.net/projects/uberkey/"
license=("GPL")
source=(http://gnu.ethz.ch/linuks.mine.nu/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('cd991329ba7031eed6caa8222424b505')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  make
}
package() {
  cd $srcdir/${pkgname}-${pkgver}
  install -D -m 755 uberkey ${pkgdir}/usr/sbin/uberkey
  install -D -m 644 uberkey.8 ${pkgdir}/usr/share/man/man8/uberkey.8
}
