# Maintainer: 

pkgname=allservers
pkgver=1.4
pkgrel=1
pkgdesc="Script to manage pacman mirrorlist, update using pacman and yaourt, and manage pacman cache."
url="https://wiki.manjaro.org/index.php?title=Allservers.sh_Script"
arch=('any')
license=('GPL')
depends=('pacman-mirrorlist' 'yaourt' 'pkgcacheclean')
source=(allservers.sh)
sha1sums=('a38d6d1df4a13c3fd79b9ed3e285ad41070ca9c2')
package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
