# Maintainer: DeadSurgeon42 <deadsurgeon42 at gmail dot com>
pkgname=singularity-music-pack
pkgver=007
pkgrel=1
pkgdesc="Extra music for the game Endgame: Singularity"
arch=(any)
url="http://www.emhsoft.com/singularity/"
license=('unknown') # The game itself is GPL, but music license is undefined (music cannot be GPL?)
depends=('singularity')
source=(http://endgame-singularity.googlecode.com/files/endgame-singularity-music-$pkgver.zip)
install=singularity-music-pack.install
md5sums=('36ab600d1f6df24e3550b37289cc7710')

package() {
	cd "$srcdir/endgame-singularity-music-$pkgver"
	mkdir -p "$pkgdir/usr/share/endgame/music/"
	cp -r ./ "$pkgdir/usr/share/endgame/music/"
}
