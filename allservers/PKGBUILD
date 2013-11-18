# Maintainer: aaditya   aaditya_gnulinux@zoho.com

pkgname=allservers
pkgver=1.1
pkgrel=1
pkgdesc="Script to manage pacman mirrorlist, update using pacman & yaourt and manage pacman cache"
url="http://forum.manjaro.org/index.php?topic=1289.0"
arch=('any')
license=('GPL')
depends=('')
optdepends=('pkgcacheclean')
source=("http://sourceforge.net/projects/mefiles/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('177dd680bc45977364f56c2f263ddc49')
package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
