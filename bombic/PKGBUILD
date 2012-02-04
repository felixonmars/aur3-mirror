# Contributor: David Watzke <david@watzke.cz>

pkgname=bombic
pkgver=0.0.1
pkgrel=2
pkgdesc="A Czech bomberman-like game"
arch=('i686' 'x86_64')
url="http://hippo.nipax.cz/download.cz.php?id=58"
license=('GPL')
depends=('sdl_image' 'sdl_ttf' 'sdl_mixer')
source=('http://hippo.nipax.cz/src/bombic-0.0.1-src.tar.gz'
	'bombic-0.0.1-sound.patch')
md5sums=('ee0e0d4594baf902bb25ecc0cb62017c'
	'7909fc33b98d8056aa1742ceefdaf0a2')

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}-src"

	patch -Np1 -i "${srcdir}/bombic-0.0.1-sound.patch"

	./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}-src"

	make DESTDIR="${pkgdir}" install
}
