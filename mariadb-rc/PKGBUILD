# Maintainer: OrdinaryMagician <saniukeokusainaya@gmail.com>
pkgname=mariadb-rc
pkgver=5.5.29
pkgrel=2
pkgdesc="initscripts support for the mariadb package"
arch=("any")
license=("GPL")
depends=("mariadb>=${pkgver}")
source=("https://dl.dropbox.com/u/3619130/antisystemd/rcscripts/mysqld")
url=("https://dl.dropbox.com/u/3619130/antisystemd/about.html")
md5sums=("3bb5a9a96340feb0184bc057ee6e330b")

package() {
  cd "${srcdir}"
  install -Dm755 mysqld "${pkgdir}/etc/rc.d/mysqld"
}
