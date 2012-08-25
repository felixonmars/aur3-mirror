# $Id: PKGBUILD 64732 2012-02-18 03:21:13Z svenstaro $
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# This package has been imported from ABS

pkgname=urbanterror41-data
pkgver=4.1.1
pkgrel=3
pkgdesc="A team-based tactical shooter based on the Quake 3 Engine (data files)"
arch=('any')
url="http://www.urbanterror.net"
license=('custom:freeware')
depends=()
makedepends=()
source=("ftp://ftp.snt.utwente.nl/pub/games/urbanterror/full_install/linux_or_mac/UrbanTerror${pkgver//./}.zip")
md5sums=('722c1fea9936593c9ef039bb068cc33b')

build() {
	cd $srcdir
}

package() {
	install -d $pkgdir/opt/urbanterror41/q3ut4/demos

	cd $pkgdir/opt/urbanterror41

	for i in $srcdir/UrbanTerror/q3ut4/*.{cfg,pk3,txt}; do
	    mv "$i" q3ut4/
	    chmod 644 "q3ut4/$(basename "$i")"
	done
	install -m644 $srcdir/UrbanTerror/q3ut4/demos/tutorial.dm_68 q3ut4/demos/TUTORIAL.dm_68

  install -Dm644 $pkgdir/opt/urbanterror41/q3ut4/readme41.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim: sw=2:ts=2 et:
