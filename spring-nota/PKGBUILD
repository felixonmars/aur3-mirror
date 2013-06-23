# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: schmoemi <schmoemi at arcor dot de>
# Contributor: Antti Oja <antti.bofh@gmail.com>
# Contributor: ReNoM <renom@list.ru>
# Contributor: parched <jagduley[at]gmail[dot]com>

pkgname=spring-nota
pkgver=1.76
pkgrel=1
pkgdesc="'Not OTA' is a rethink of the Total Annihilation universe but completely different gameplay from Original TA that uses the Spring engine."
arch=('any')
url=('http://nota.machys.net/')
license=('custom')
depends=('spring')
source=(http://springfiles.com/sites/default/files/downloads/spring/games/nota${pkgver/.}.sdz)
sha1sums=('3d4251d817ca5b6a3e62ec37572887b485bae235')
noextract=(nota${pkgver/.}.sdz)

package() {
	mkdir -p $pkgdir/usr/share/spring/mods
	install -m 644 -t $pkgdir/usr/share/spring/mods $srcdir/nota${pkgver/.}.sdz
}
