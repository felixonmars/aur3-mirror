# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=wolf-wildwest
pkgver=1.1613
pkgrel=1
pkgdesc="The WildWest is a Multiplayer modification of the game Return to Castle Wolfenstein."
arch=('i686' 'x86_64')
url="http://www.the-wildwest.co.uk/indexa.htm"
license=('GPL')
depends=('wolf')
source=('http://www.the-wildwest.com/files/beta/TheWildWest_11613_Linux_mac.zip')
md5sums=('deb45f21228d9a5a13dde2e0e2554c92')

build() {
	cd $srcdir

	install -d $pkgdir/opt/wolf
	cp -R WildWest $pkgdir/opt/wolf
}
