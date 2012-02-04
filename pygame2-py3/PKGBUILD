# Maintainer: BeholdMyGlory <larvid@gmail.com>
pkgname=pygame2-py3
pkgver=2.0.0_alpha5
realver=2.0.0-alpha5
pkgrel=1
pkgdesc="Pygame Reloaded, or Pygame2, is the successor to Pygame"
arch=(i686 x86_64)
url="http://code.google.com/p/pgreloaded/"
license=('LGPL')
depends=('python3' 'sdl_mixer' 'sdl_ttf' 'sdl_image' 'sdl_gfx' 'portmidi')
makedepends=()
source=(http://pgreloaded.googlecode.com/files/pygame2-$realver.tar.gz)
md5sums=('9b79ae86fddb613e08cbdc8bc8b96a56')

build() {
  cd $srcdir/pygame2-$realver
  python3 setup.py install --root=${pkgdir} --prefix=/usr
}
