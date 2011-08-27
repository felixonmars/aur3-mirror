# Maintainer: Jonathan Lestrelin <zanko@daemontux.org>

pkgname=easy-union-nautilus
pkgver=0.4~bzr163
pkgrel=1
pkgdesc="Utility to make the content of multiple directories available in a single one (through persistent unionfs mount points). (Nautilus extension)."
arch=('any')
url="https://launchpad.net/nautilus-easy-unionfs"
license=('GPL')
depends=('easy-union' 'nautilus')
source=("http://ppa.launchpad.net/zanko/daemontux-stuff/ubuntu/pool/main/e/easy-union/${pkgname}_${pkgver}_all.deb")
md5sums=('d345ef45eda80341c8e3045e3cd713ec')

package() {
	cd "${pkgdir}" &&
	tar -xzf "${srcdir}/data.tar.gz" ||
	return 1
}

