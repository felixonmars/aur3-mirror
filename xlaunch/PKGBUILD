# Contributor: DuGi (dugi@irc.pl)
# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>


pkgname=xlaunch
pkgver=20070607
pkgrel=2
pkgdesc="Bash script to launch programs on different displays"
arch=('any')
url="https://forums.gentoo.org/viewtopic-t-483004.html"
license=('GPL2')
depends=('bash' 'xorg-xinit')
source=("${pkgname}-${pkgver}.sh::http://sam.intelunix.fr/truc/${pkgname}")
md5sums=('4baf4d556ac94e17573fb4fae8cb70fe')


package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
