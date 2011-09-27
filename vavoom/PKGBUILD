# Maintainer: Christian Beckhaeuser <zicodxx[AT]gmx[DOT]de>

pkgname=vavoom
pkgver=1.33
pkgrel=2
pkgdesc="A highly advanced Doom engine port with added support for Heretic/Hexen/Strife"
arch=('i686' 'x86_64')
url="http://vavoom-engine.com/"
license=('GPL')
depends=('libgl' 'wxgtk' 'openal' 'flac' 'libmad' 'sdl_mixer')
optdepends=('timidity++' 'freedoom' 'doom1-wad' 'vavoom-models' 'vavoom-textures')
makedepends=('cmake>=2.4')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('f3b40df71eeb2f1c8956b81c995dfc28')

build() {
  cd $pkgname-$pkgver

  cmake . \
	-DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DIWADDIR="-IWADDIR \"/usr/share/doom\" -opengl" \
	|| return 1

  make DESTDIR="$pkgdir" install
}
