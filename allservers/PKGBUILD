# Maintainer: aaditya  <aaditya_gnulinux[at]zoho[dot]com>

pkgname=allservers
pkgver=1.3
pkgrel=1
pkgdesc="Script to manage pacman mirrorlist, update using pacman and yaourt, and manage pacman cache."
url="http://forum.manjaro.org/index.php?topic=1289.0"
arch=('any')
license=('GPL')
depends=('pacman-mirrorlist')
optdepends=('yaourt' 'pkgcacheclean')
source=("http://downloads.sourceforge.net/project/mefiles/${pkgname}-${pkgver}.tar.gz")
sha1sums=('4e9c00c599e642a113109c1d8f08880e07624409')
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
