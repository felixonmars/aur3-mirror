# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=wolf-degeneration
pkgver=1.1
pkgrel=1
pkgdesc="DeGeneration is a Multiplayer modification of the game Return to Castle Wolfenstein."
arch=('i686' 'x86_64')
url="http://tramdesign.planetwolfenstein.gamespy.com/degeneration/index.html"
license=('GPL')
depends=('wolf')
source=('http://www.tramdesign.net/files/degeneration/DeGeneration_v1.1_full.zip')
md5sums=('de2a0f9ce06ad15bd0bcf5f07329d698')

build() {
	cd $srcdir

	install -d $pkgdir/opt/wolf
	cp -R degeneration $pkgdir/opt/wolf
}
