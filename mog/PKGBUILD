# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Márcio Carneiro <marciocr@gmail.com>

pkgname=mog
pkgver=0.63.1548
pkgrel=1
pkgdesc='A remake of the classic platformer "Knightmare II: The Maze of Galious"'
arch=('i686' 'x86_64')
url="http://www.braingames.getput.com/mog/"
license=('GPL')
depends=('bash' 'gcc-libs' 'sdl_image' 'sdl_mixer' 'sdl_sound')
source=(http://braingames.jorito.net/mog/downloads/mog.src_0.63-1548.tgz \
	$pkgname.sh)
md5sums=('68604c258ce7347662777d853d895769'
         '68c37b2a2f84407e24b37aa2d8379c23')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  make || return 1
  make	PREFIX="$pkgdir"/usr \
	GAMEDIR="$pkgdir"/usr/bin \
	BINDIR="$pkgdir"/usr/share/mog \
	install

  install -m755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
