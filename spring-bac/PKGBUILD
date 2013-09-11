# Maintainer: James Duley <jagduley at gmail dot com >
pkgname=spring-bac
pkgver=3.00
pkgrel=1
pkgdesc="BA Chicken Defense is a gamemode where the players and their robot armies attempt to fend off increasingly strong waves of chickens spawning from burrows scattered across the map."
arch=(any)
url="http://springrts.com/wiki/Balanced_Annihilation"
license=('unknown')
depends=('spring-ba=7.81')
source=("http://springfiles.com/sites/default/files/downloads/spring/games/bac-v$pkgver.sdz")
noextract=("bac-v$pkgver.sdz")
md5sums=('69ef099de4f81eebf599f7d625ab6ff3')

package() {

	mkdir -p $pkgdir/usr/share/spring/mods

	install -TDm 644 $srcdir/bac-v$pkgver.sdz $pkgdir/usr/share/spring/mods/bac-v$pkgver.sdz
}
