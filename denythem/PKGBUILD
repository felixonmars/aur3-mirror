# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=denythem
pkgver=0.4
pkgrel=1
pkgdesc="A program designed to protect your Linux system from malicious attacks"
arch=('any')
url="http://matthewrogers.org/?p=3"
license=('GPL3')
depends=('perl-date-pcalc' 'iptables')
source=(http://matthewrogers.org/wp-content/uploads/2010/10/denythem.v004.pl_.gz)
md5sums=('9bfa624572e30f0de7f69a18c861d8c6')

build() {
  cd ${srcdir}

  install -Dm755 $(basename "${source[0]//.gz/}") ${pkgdir}/usr/bin/$pkgname
}
