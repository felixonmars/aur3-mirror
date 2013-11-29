# Maintainer: aaditya  aaditya_gnulinux@zoho.com

pkgname=timeset
pkgver=1.4
pkgrel=3
pkgdesc="A script for managing system date and time."
url="http://git.manjaro.org/aadityabagga/timeset/"
arch=('any')
license=('GPL')
depends=('bash')
optdepends=('ntp')
source=("http://git.manjaro.org/aadityabagga/timeset/repository/archive")
sha1sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}.git"
  make DESTDIR=${pkgdir} install
}


# vim:set ts=2 sw=2 et:

