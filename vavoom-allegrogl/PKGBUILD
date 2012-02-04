# Contributor: Christoph Zeiler <rabyteNOSPAM_at_moonblade.dot.org>

pkgname=vavoom-allegrogl
pkgver=1.30
pkgrel=1
pkgdesc="A highly advanced Doom engine port with added support for Heretic/Hexen/Strife"
arch=('i686' 'x86_64')
url="http://vavoom-engine.com/"
license=('GPL')
depends=('libgl' 'wxgtk' 'openal' 'libmad' 'allegrogl' 'libvorbis' 'libmikmod')
optdepends=('timidity++ (MIDI music output)' 'freedoom' 'doom1-wad' \
	'vavoom-models' 'vavoom-textures')
makedepends=('cmake>=2.4')
provides=('vavoom')
conflicts=('vavoom')
install=vavoom.install
source=(http://downloads.sourceforge.net/vavoom/vavoom-$pkgver.tar.bz2 \
	vavoom-$pkgver-noiwad-fix.patch \
	vavoom-$pkgver-timidity++path.patch \
	vavoom-$pkgver-gcc44-fix.patch)
md5sums=('205c3645006232d75790fb8779a54e85'
         '0498f9cf9658a600c855b608554b5261'
         '14cc2ff050c254d3f6ada43f59ce32e2')

build() {
  cd vavoom-$pkgver

  patch -Np0 -i ../vavoom-$pkgver-noiwad-fix.patch || return 1
  patch -Np0 -i ../vavoom-$pkgver-timidity++path.patch || return 1
  patch -Np1 -i ../vavoom-$pkgver-gcc44-fix.patch || return 1

  cmake	. \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DIWADDIR="-IWADDIR \"/usr/share/doom\" -opengl" \
	-DWITH_ALLEGRO=Y \
	|| return 1

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
