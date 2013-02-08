pkgname=scarface-extractor
pkgver=1.0
pkgrel=1
pkgdesc="Scarface: The World Is Yours' music files extractor"
arch=(any)
url=("http://forum.xentax.com/viewtopic.php?f=15&t=2143")
license=(GPL)
depends=(python)
source=(scarface.py)
sha1sums=(85f1fec90e659fcfed3a1d2e19baf02a427ff22e)

package() {
	install -D -m755 scarface.py ${pkgdir}/usr/bin/scarface
}

